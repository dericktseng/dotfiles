#!/bin/bash
xorgconfd="/etc/X11/xorg.conf.d"
systemdlogin="/etc/systemd/system/getty@tty1.service.d"
self="$USER"

if [ $(id -u) -eq 0 ]; then
	echo "please do not execute as root."
	exit 1
fi

# user systemctl services
systemctl --user --now enable psd

# system services
sudo systemctl --now enable ufw
sudo systemctl --now enable NetworkManager
sudo systemctl --now enable cronie
sudo systemctl enable sddm
sudo ufw enable

# synchronize clock with systemd timesync ntp
sudo timedatectl set-ntp true

# change shell to zsh.
chsh -s /bin/zsh

# X11 settings
sudo mkdir -p "$xorgconfd"
for f in ./xorgconf/*; do
    sudo cp -i "$f" "$xorgconfd"
done

# backlight settings: adds user to group video
sudo usermod -aG video "$self"

# Laptop-mode-tools optional.
packagename='laptop-mode-tools'
cloneURL="https://aur.archlinux.org/$packagename.git"

read -r -p "Do you want to install laptop-mode-tools (y/N)" response
case "$response" in
	[yY][eE][sS]|[yY])
		git clone "$cloneURL"
		makepkg -sri "$packagename" ;;
	*)
		echo "skipping $packagename" ;;
esac

# xf86 video drivers
drivers=('xf86-video-intel' 'xf86-video-amdgpu')
for i in "${!drivers[@]}"; do 
	printf "%s - %s\n" "$i" "${drivers[$i]}"
done

drivername=''
drivernum=0
while [ -z "$drivername" ] && [ ! -z "$drivernum" ]; do
	read -r -p "Which graphics drivers (Number, empty to skip): " drivernum
	if [[ "$drivernum" =~ ^[0-9]+ ]]; then
		drivername="${drivers[$drivernum]}"
	fi
done
if [ -n "$drivername" ]; then
	sudo pacman -S "$drivername"
else
	echo "skipping graphics drivers"
fi

# install nvim packer
git clone --depth 1 'https://github.com/wbthomason/packer.nvim'\
    "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"

# firefox changes
echo "Firefox Manual about:config changes"
echo "https://wiki.archlinux.org/title/Firefox#Hardware_video_acceleration"
echo "https://wiki.archlinux.org/title/Hardware_video_acceleration"
echo "browser.cache.disk.enable = false"
echo "browser.compactmode.show = true"
echo "gfx.webrender.all = true"
echo "accessibility.force_disabled = 1"
echo "enable fission"
echo "and cookie related changes on https://www.privacytools.io"
