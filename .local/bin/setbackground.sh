#!/bin/bash
mkdir -p $HOME/Pictures/Wallpaper
wallpaper=$(fd -t f . $HOME/Pictures/Wallpaper | fzf)
/usr/bin/feh --bg-scale $wallpaper
