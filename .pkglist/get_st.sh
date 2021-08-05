#!/bin/bash
# gets my ST build
mkdir st
cd st
url='https://raw.githubusercontent.com/MetriC-DT/st/master/PKGBUILD'
wget "$url"
yes | makepkg -sri
cd ..
rm -rf st
