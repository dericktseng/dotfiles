#!/bin/bash
if [ -f "$@" ]; then
    parentdir=$(dirname "$@")
    imv -r "$parentdir" -n "$@"
fi
