#!/bin/bash

function searchwallpaper() {
	mkdir -p $HOME/Pictures/Wallpaper
	wallpaper=$(fd -t f . $HOME/Pictures/Wallpaper | fzfimg.sh)
	/usr/bin/feh --bg-scale $wallpaper > /dev/null 2>&1
}

searchwallpaper
