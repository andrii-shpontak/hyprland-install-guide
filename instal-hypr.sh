# Install all require packages
sudo pacman -S hyprpaper waybar ttf-font-awesome otf-font-awesome ttf-jetbrains-mono fish pkgfile ttf-dejavu powerline-fonts inetutils nwg-look papirus-icon-theme fastfetch thunar meson hyprpicker pavucontrol



# Install YAY packages
yay -S hyprshot

#MONITORS
hyprctl monitors
#EXAMPLE
monitor=HDMI-A-1, 1920x1080@60, 0x0, 1
monitor=eDP-1, 1280x720@60, 1920x360, 1


# network
nmcli
nmcli device wifi list
nmcli device wifi connect FBI_5G password Roma2807


# Download and install YAY
git clone https://aur.archlinux.org/yay.git
cd yay
mkpkg -si


# download configs
git clone https://github.com/Aptivace/hyprland-config
cp ~/hyprland-config/kitty/kitty.conf ~/.config/kitty/
cp -r ~/hyprland-config/waybar/ ~/.config/
cp -r ~/hyprland-config/wofi/ ~/.config/
cp -r ~/hyprland-config/fastfetch/ ~/.config/
cp -r ~/hyprland-config/hypr/hyprpaper.conf ~/.config/hypr/

# Change shell
chsh
/bin/fish


# Clone GTK theme repo
git clone https://github.com/vinceliuice/Graphite-gtk-theme
cd Graphite-gtk-theme
./install.sh

# Meson
git clone https://github.com/ArtsyMacav/wlogout.git
cd wlogout/
meson build
ninja -C build
sudo ninja -C build install
