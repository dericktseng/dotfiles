#!/bin/bash
xorgconf="/etc/X11/xorg.conf.d"
systemdlogin="/etc/systemd/system/getty@tty1.service.d"

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

# change shell to zsh.
chsh -s /bin/zsh

# setup tmux plugin manager
git clone "https://github.com/tmux-plugins/tpm" "$HOME/.tmux/plugins/tpm"
echo "tpm: Remember to install with (prefix+I)"

# drop in file for autologin
sudo mkdir -p "$systemdlogin"
sudo cp -i override.conf "$systemdlogin"

# X11 touchpad settings
sudo mkdir -p "$xorgconf"
sudo cp -i 30-touchpad.conf "$xorgconf"

# tlp is optional.
echo "please start tlp manually!"

# xf86 video drivers
echo "Make sure to install xf86-video-intel or xf86-video-amdgpu"

# firefox changes
echo "Firefox Manual about:config changes"
echo "https://wiki.archlinux.org/title/Firefox#Hardware_video_acceleration"
echo "https://wiki.archlinux.org/title/Hardware_video_acceleration"
echo "browser.cache.disk.enable = false"
echo "browser.compactmode.show = true"
echo "media.mediasource.webm.enabled = false"
echo "media.mediasource.webm.audio.enabled = false"
echo "and cookie related changes on privacytools.io"
