#!/bin/sh
lockscreenimage=$HOME/Pictures/Wallpaper/lockscreen.png
defaultbackgroundcolor="5fc5eb"

i3lock \
    -p default \
    -i "$lockscreenimage" \
    --ignore-empty-password \
    --show-failed-attempts \
    -c "$defaultbackgroundcolor"
