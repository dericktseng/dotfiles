#!/bin/bash
if [ -f "$@" ]; then
    case "$@" in
        *.svg)  feh -F --conversion-timeout 1 -S filename . --start-at "$@";;
            *)  feh -FZ -S filename . --start-at "$@";;
    esac
fi
