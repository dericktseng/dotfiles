#!/bin/bash
xorgconf="/etc/X11/xorg.conf.d"
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
sudo ufw enable

# change shell to zsh.
chsh -s /bin/zsh

# drop in file for autologin
sudo mkdir -p "$systemdlogin"
sed "s/\[USER\]/$self/g" override.template.conf > override.conf
sudo cp -i override.conf "$systemdlogin"

# X11 touchpad settings
sudo mkdir -p "$xorgconf"
sudo cp -i 30-touchpad.conf "$xorgconf"

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
if [ ! -z "$drivername" ]; then
	sudo pacman -S "$drivername"
else
	echo "skipping graphics drivers"
fi

# firefox changes
echo "Firefox Manual about:config changes"
echo "https://wiki.archlinux.org/title/Firefox#Hardware_video_acceleration"
echo "https://wiki.archlinux.org/title/Hardware_video_acceleration"
echo "browser.cache.disk.enable = false"
echo "browser.compactmode.show = true"
echo "gfx.webrender.all = true"
echo "accessibility.force_disabled = 1"
echo "and cookie related changes on https://www.privacytools.io"
