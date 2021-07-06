#!/bin/bash

volPercent="$(amixer -q -D pulse | grep Master -A 5 | tail -1| cut -d ' ' -f 7 | sed 's/[^0-9]//g')"
hasVolume="$(amixer -q -D pulse | grep Master -A 5 | tail -1 | cut -d ' ' -f 8 | cut -d '[' -f 2 | cut -d ']' -f 1)"
dunstID=1000
timeout=1500

if [[ $hasVolume == 'on' ]]; then
	dunstify -r $dunstID -t $timeout "Volume $volPercent%"
else
	dunstify -r $dunstID -t $timeout "Volume Muted"
fi
