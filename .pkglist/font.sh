#!/bin/bash

# install firacode nerd font
url='https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip'
filename='FiraCode.zip'
fonts_dir="$HOME/.local/share/fonts"
download_dir="/tmp"

mkdir -p "$fonts_dir"
curl -fL --output-dir "$download_dir" -o "$filename" "$url"
unzip -d "$fonts_dir" "$download_dir/$filename"
