#!/bin/bash
iwdconfd="/etc/iwd/"
systemdconfd="/etc/systemd/"
self="$USER"

if [ $(id -u) -eq 0 ]; then
	echo "please do not execute as root."
	exit 1
fi

# user systemctl services
systemctl --user --now enable psd

# system services
sudo systemctl --now enable iwd
sudo systemctl --now enable systemd-resolved

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

# iwd settings
sudo mkdir -p "$iwdconfd"
sudo cp -i "./conf/iwd/main.conf" "$iwdconfd"
read -r -p "Install eduroam configuration (y/N): " response
case "$response" in
    [yY])
        read -r -p "Username: " username
        read -r -p "Password: " password
        read -r -p "Domain: " domain
        sed -e "s/{USERNAME}/$username/g" \
            -e "s/{PASSWORD}/$password/g" \
            -e "s/{DOMAIN}/$domain/g" \
            conf/iwd/eduroam.8021x > eduroam.8021x
        sudo mv -i eduroam.8021x /var/lib/iwd/
        ;;
    *)
        echo "skipping eduroam configuration"
        ;;
esac

# firefox changes
echo "Firefox Manual about:config changes"
echo "browser.cache.disk.enable = false"
echo "browser.compactmode.show = true"
echo "gfx.webrender.all = true"
echo "accessibility.force_disabled = 1"
echo "media.ffmpeg.vaapi.enabled = true"
echo "media.rdd-vpx.enabled = false"
echo "gfx.webrender.compositor.force-enabled = true"
echo "ui.key.menuAccessKeyFocuses = false"
echo "---------------------------------"
echo "Plugins enable Openh264 Video Codec"

# matlab install process: delete the libfreetype.so file inside the matlab directory to run
