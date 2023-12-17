#!/bin/bash
systemdconfd="/etc/systemd/"
self="$USER"

if [ $(id -u) -eq 0 ]; then
	echo "please do not execute as root."
	exit 1
fi

# user systemctl services
systemctl --user --now enable psd

# system services
sudo systemctl --now enable systemd-resolved
sudo systemctl --now disable NetworkManager-wait-online

# synchronize clock with systemd timesync ntp
sudo timedatectl set-ntp true

# change shell to zsh.
chsh -s /bin/zsh

# backlight settings: adds user to group video
sudo usermod -aG video "$self"

# blacklists from modprobe
sudo cp -i ./conf/modprobe/* /etc/modprobe.d/

# systemd settings
sudo mkdir -p "$systemdconfd"
sudo cp -ir ./conf/systemd/* "$systemdconfd"

# NetworkManager settings
sudo cp -i ./conf/networkmanager/* /etc/NetworkManager/conf.d/

# input method switching
imsettings-switch fcitx5

# firefox changes
echo "---------------------------------"
echo "Firefox Plugins enable Openh264 Video Codec"

# matlab install process:
# delete the libfreetype.so file inside the matlab directory to run installer
# delete the libstdc++.so file inside the sys/os/glnx64 directory to have opengl
