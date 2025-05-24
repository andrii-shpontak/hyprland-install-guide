sudo pacman -S git ttf-firacode-nerd filezilla zsh zsh-completions neofetch spectacle gwenview qbittorrent dosfstools nginx docker docker-compose bluez bluez-utils linux-firmware bluedevil obs-studio

git clone https://aur.archlinux.org/yay.git

chmod 777 yay && cd yay && makepkg -s

# Bluetooth
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service


yay -S google-chrome slack-desktop telegram-desktop-bin  visual-studio-code-bin spotify-adblock

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
nvm install 22

# Docker
sudo usermod -aG docker $USER
sudo systemctl enable docker
sudo systemctl start docker

# For Ngrok
# in file
sudo nano /etc/hosts
127.0.0.1 localhost


# after put in system you`r .ssh folder past this command to terminal
# chmod 700 ~/.ssh && chmod 600 ~/.ssh/*

# for git
git config --global user.name "andriy-shpontak" && git config --global user.email "andriishpontak@gmail.com" && git config --global core.editor "nano"



# NGINX
# copy nginx.conf to /etc/nginx/nginx.conf
# generate certeficates:

sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /etc/ssl/private/selfsigned.key \
  -out /etc/ssl/certs/selfsigned.crt \
  -subj "/CN=dev-home-777.tplinkdns.com"



# USB prevent cache

sudo nano /etc/udev/rules.d/99-usb-sync-mount.rules
# type in 
ENV{ID_BUS}=="usb", ENV{ID_FS_TYPE}!="", ENV{UDISKS_IGNORE}!="1", ENV{UDISKS_MOUNT_OPTIONS_DEFAULTS}="sync"

sudo nano /etc/udev/rules.d/60-usb-storage-no-cache.rules
# type in
ACTION=="add", SUBSYSTEM=="block", ENV{ID_BUS}=="usb", ATTR{bdi/writeback}="0"
# then run
sudo udevadm control --reload-rules
sudo udevadm trigger
reboot