#!/bin/bash
wallpaperdir=$HOME/Pictures/Wallpaper

function searchwallpaper() {
	mkdir -p $wallpaperdir
	cd $wallpaperdir
	wallpaper=$(fd -t f . . | fzfimg.sh)
	feh --bg-scale $wallpaper > /dev/null 2>&1
}

searchwallpaper
