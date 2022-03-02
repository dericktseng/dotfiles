#!/bin/bash
xorgconfd="/etc/X11/xorg.conf.d"
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
sudo systemctl --now enable ufw
sudo systemctl --now enable iwd
sudo systemctl --now enable systemd-networkd
sudo systemctl --now enable systemd-resolved
sudo systemctl enable sddm

# synchronize clock with systemd timesync ntp
sudo timedatectl set-ntp true

# change shell to zsh.
chsh -s /bin/zsh

# backlight settings: adds user to group video
sudo usermod -aG video "$self"

# dnf settings
sudo mkdir -p "/etc/dnf/"
for f in ./conf/dnf/*; do
    cp "$f" /etc/dnf/
done

# X11 settings
sudo mkdir -p "$xorgconfd"
for f in ./conf/xorg/*; do
    sudo cp -i "$f" "$xorgconfd"
done

# systemd settings
sudo mkdir -p "$systemdconfd"
cp -ir ./conf/systemd/* "$systemdconfd"

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
echo "---------------------------------"
echo "Plugins enable Openh264 Video Codec"
