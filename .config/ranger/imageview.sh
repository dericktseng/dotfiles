#!/bin/bash
if [ -f "$@" ]; then
    parentdir="$(dirname "$@")"
    case "$@" in
        *.gif)  mpv --fs --loop "$@";;
        *.svg)  feh -F --conversion-timeout 1 -S filename . --start-at "$@";;
            *)  feh -FZ --scale-down -Sfilename "$parentdir" --start-at "$@";;
    esac
fi
