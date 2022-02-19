#!/bin/bash
if [ $(id -u) -eq 0 ]; then
    echo "Do not run as root!"
    exit 1
fi

# unlock rpmfusion
sudo dnf install \
	https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
	https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# install all packages
sudo dnf --allowerasing install $(cat ./pkglist/pkglist.txt)

# install groups
cat ./pkglist/groups.txt | xargs sudo dnf groupinstall

# install copr
while read -r line; do
    yes | sudo dnf copr enable $line
done < ./pkglist/copr.txt
cat ./pkglist/copr.txt | cut -d '/' -f 2 | xargs sudo dnf -y install --skip-broken

# install nvim packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    $HOME/.local/share/nvim/site/pack/packer/start/packer.nvim

# install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
    $HOME/.powerlevel10k

# pip install pillow and ueberzug
CC="cc -mavx2" pip3 install -U pillow-simd
pip3 install -U ueberzug
pip3 install -U neovim-remote
