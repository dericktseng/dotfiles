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
