#!/bin/bash
if [ $(id -u) -eq 0 ]; then
    echo "Do not run as root!"
    exit 1
fi

# dnf settings
sudo mkdir -p "/etc/dnf/"
cat ./conf/dnf/dnf.conf | sed "s/NUM_CORES/$(nproc)/" | sudo tee /etc/dnf/dnf.conf > /dev/null

# first run update
sudo dnf upgrade -y

# unlock rpmfusion
sudo dnf install \
	https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
	https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# install copr repositories
while read -r line; do
    yes | sudo dnf copr enable $line
done < ./pkglist/copr.txt

# install all packages (including copr)
cat ./pkglist/pkglist.txt ./pkglist/pkglist-copr.txt | xargs sudo dnf -y --allowerasing install

# install groups
cat ./pkglist/groups.txt | xargs sudo dnf -y groupinstall

# install flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
while read -r line; do
    yes | sudo flatpak install $line
done < ./pkglist/flatpak.txt

# install nvim packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    $HOME/.local/share/nvim/site/pack/packer/start/packer.nvim

# install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
    $HOME/.powerlevel10k

# pip packages
pip3 install -U pyright
