#!/bin/bash
if [ -f "$@" ]; then
    parentdir=$(dirname "$@")
    case "$@" in
        *.gif)  mpv --fs --loop "$@" & ;;
        *.svg)  feh -Z -F -B black --conversion-timeout 1 -Sfilename "$parentdir" --start-at "$@" ;;
            *)  feh -Z -F -B black --scale-down -Sfilename "$parentdir" --start-at "$@" ;;
    esac
fi
