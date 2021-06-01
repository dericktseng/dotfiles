#!/bin/bash

# gets my ST build
mkdir st
cd st
url='https://raw.githubusercontent.com/MetriC-DT/st/master/PKGBUILD'
wget "$url"
yes | makepkg -sri
cd ..
rm -rf st


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
