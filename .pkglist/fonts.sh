#!/usr/bin/env bash

#  installing firacode fonts
fonts_dir="$HOME/.local/share/fonts"
mkdir -p $fonts_dir
types=('Bold' 'Light' 'Medium' 'Regular' 'Retina' 'Semibold')
for t in ${types[@]}; do
    wget -P "$fonts_dir" "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/$t/complete/Fira%20Code%20$t%20Nerd%20Font%20Complete.ttf"
    wget -P "$fonts_dir" "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/$t/complete/Fira%20Code%20$t%20Nerd%20Font%20Complete%20Mono.ttf"
done
fc-cache -f -v
