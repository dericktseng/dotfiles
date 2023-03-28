#!/bin/bash

# hosted on https://git.io/JCfgy

# disallow if running as root
if [ "$EUID" -eq 0 ]; then
    echo "Do not run as root!"
    exit 1
fi

git clone --bare 'https://github.com/MetriC-DT/dotfiles' $HOME/.dotfiles
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout -f
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no

# install and update submodules
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME submodule init
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME submodule update
