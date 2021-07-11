#!/bin/bash

# hosted on https://git.io/JCfgy

# disallow if running as root
if [ "$EUID" -eq 0 ]; then
    echo "Do not run as root!"
    exit 1
fi

alias dot="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
git clone --bare 'https://github.com/MetriC-DT/dotfiles' $HOME/.dotfiles
dot checkout
dot config --local status.showUntrackedFiles no
