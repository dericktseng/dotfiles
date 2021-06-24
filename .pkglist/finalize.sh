#!/bin/bash

# user systemctl services
systemctl --user --now enable psd

# system services
sudo systemctl --now enable ufw
sudo systemctl --now enable NetworkManager
sudo systemctl --now enable cronie

# change shell to zsh.
chsh -s /bin/zsh

# tlp is optional.
echo "please start tlp manually!"

# xf86 video drivers
echo "Make sure to install xf86-video-intel or xf86-video-amdgpu"

# firefox changes
echo "Firefox Manual about:config changes"
echo "browser.cache.disk.enable = false"
echo "browser.compactmode.show = true"
echo "media.mediasource.webm.enabled = false"
echo "media.mediasource.webm.audio.enabled = false"
echo "and cookie related changes on privacytools.io"
