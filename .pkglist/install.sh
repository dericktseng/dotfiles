#!/bin/bash
if [ $(id -u) -eq 0 ]; then
    echo "Do not run as root!"
    exit 1
fi

# dnf settings
sudo mkdir -p "/etc/dnf/"
for f in ./conf/dnf/*; do
    sudo cp "$f" /etc/dnf/
done

# unlock rpmfusion
sudo dnf install \
	https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
	https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# install all packages
cat ./pkglist/pkglist.txt | xargs sudo dnf -y --allowerasing install

# install groups
cat ./pkglist/groups.txt | xargs sudo dnf -y groupinstall

# install copr
while read -r line; do
    yes | sudo dnf copr enable $line
done < ./pkglist/copr.txt
cat ./pkglist/copr.txt | cut -d '/' -f 2 | xargs sudo dnf -y install --skip-broken

# install flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
while read -r line; do
    sudo flatpak install $line
done < ./pkglist/flatpak.txt

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
pip3 install -U pyright
