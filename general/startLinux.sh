sudo pacman -S git ttf-firacode-nerd filezilla zsh zsh-completions neofetch spectacle gwenview qbittorrent dosfstools nginx certbot certbot-nginx

git clone https://aur.archlinux.org/yay.git

chmod 777 yay && cd yay && makepkg -s

# Bluetooth
sudo pacman -S bluez bluez-utils linux-firmware bluedevil
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service


#sudo pacman -U yay...

yay -S google-chrome slack-desktop telegram-desktop-bin skypeforlinux-bin visual-studio-code-bin simplescreenrecorder spotify-adblock

# end of instalation
sudo chsh -s /bin/zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >> ~/.zshrc


# autocomplete & highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo 'plugins=(git zsh-syntax-highlighting zsh-autosuggestions)' >> ~/.zshrc

# NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# reboot terminal
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# install needed versions

nvm install 14.17.6
nvm install 18.19.1
nvm install 22.11.0

# Docker
sudo pacman -S docker
sudo usermod -aG docker $USER
sudo systemctl enable docker
sudo systemctl start docker
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose


# For Ngrok
# in file
sudo nano /etc/hosts
127.0.0.1 localhost


# after put in system you`r .ssh folder past this command to terminal
# chmod 700 ~/.ssh && chmod 600 ~/.ssh/*

# wallpapers
# https://wallhaven.cc/w/d5xwem
# https://wallhaven.cc/w/zmrqgj

# for git
git config --global user.name "andriy-shpontak" && git config --global user.email "andriishpontak@gmail.com" && git config --global core.editor "nano"

# NGINX
# copy nginx.conf to /etc/nginx/nginx.conf
# generate certeficates:
# sudo certbot --nginx -d dev-home-777.tplinkdns.com

