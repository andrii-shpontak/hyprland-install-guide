#!/bin/bash

# System update
sudo apt update
sudo apt full-upgrade -y

# Install essential packages
sudo apt install -y git curl neofetch obs-studio gnome-software-plugin-flatpak gnome-software flameshot nginx zsh

# Install Docker
curl -fsSL https://get.docker.com | sudo bash
sudo usermod -aG docker $USER
sudo apt install docker-compose-plugin -y
sudo apt install -y postgresql-client

# Install VS Code
curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update
sudo apt install -y code
rm packages.microsoft.gpg

# Install Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y ./google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

# Setup Flatpak and install apps
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub io.dbeaver.DBeaverCommunity -y
flatpak install flathub org.telegram.desktop -y
flatpak install flathub com.discordapp.Discord -y

# Fix SSH permissions
chmod 700 ~/.ssh && chmod 600 ~/.ssh/*

# Git configuration
git config --global user.name "a-shpontak"
git config --global user.email "andriishpontak@cowchain.io"
git config --global core.editor "nano"

# Generate self-signed certificate for nginx
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /etc/ssl/private/selfsigned.key \
  -out /etc/ssl/certs/selfsigned.crt \
  -subj "/CN=dev-home-777.tplinkdns.com"

# Enable and start nginx
sudo systemctl enable nginx
sudo systemctl start nginx

# Install and set zsh as default shell
sudo apt install -y zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install zsh plugins and theme
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >> ~/.zshrc
echo 'plugins=(git zsh-syntax-highlighting zsh-autosuggestions)' >> ~/.zshrc

# Create Flameshot Wayland wrapper script
mkdir -p ~/.local/bin
cat <<EOF > ~/.local/bin/flameshot-gui-wayland.sh
#!/bin/zsh
export XDG_CURRENT_DESKTOP=GNOME
flameshot gui
EOF

chmod +x ~/.local/bin/flameshot-gui-wayland.sh

# Install NVM, Node.js 22 and Yarn v1
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
export NVM_DIR="\$HOME/.nvm"
source "\$NVM_DIR/nvm.sh"
nvm install 22
npm install -g yarn@1

echo "✅ Setup complete. Please reboot or log out and back in to apply all changes (Docker group, zsh shell, etc.)."
