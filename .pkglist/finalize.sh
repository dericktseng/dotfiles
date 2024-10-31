#!/bin/bash
systemdconfd="/etc/systemd/"
self="$USER"

if [ $(id -u) -eq 0 ]; then
	echo "please do not execute as root."
	exit 1
fi

echo "Did you update the wireless interface in ./conf/systemd/system/wifi-powersave.service?"
select yn in "yes" "no"; do
    case $yn in
        yes) break ;;
        no) exit ;;
    esac
done

# install microsoft fonts
sudo dnf install -y 'https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm'

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
sudo systemctl enable --now wifi-powersave

# NetworkManager settings
sudo cp -i ./conf/networkmanager/* /etc/NetworkManager/conf.d/
sudo systemctl restart NetworkManager

# input method switching
imsettings-switch fcitx5

# firefox changes
echo "---------------------------------"
echo "Firefox Plugins enable Openh264 Video Codec"
echo "reboot after completion"

# matlab install process:
# delete the libfreetype.so file inside the matlab directory to run installer
# delete the libstdc++.so file inside the sys/os/glnx64 directory to have opengl
