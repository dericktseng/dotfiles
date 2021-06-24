#!/bin/bash
if [ $(id -u) -ne 0 ]; then exec sudo $0; fi

pacman -S --needed - < pkglist.txt
