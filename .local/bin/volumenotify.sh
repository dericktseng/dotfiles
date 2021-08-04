#!/bin/bash

volPercent="$(amixer -q -D pulse | grep Master -A 5 | tail -1| cut -d ' ' -f 7 | sed 's/[^0-9]//g')"
hasVolume="$(amixer -q -D pulse | grep Master -A 5 | tail -1 | cut -d ' ' -f 8 | cut -d '[' -f 2 | cut -d ']' -f 1)"
bar=$(seq -s "─" 0 $((volPercent / 5)) | sed 's/[0-9]//g')

title="Volume"
iconSound="audio-volume-high"
iconMuted="audio-volume-muted"
dunstID=1000
timeout=2000
media=$(mpvtitle.sh)

if [[ $hasVolume == 'on' ]]; then
	dunstify -r $dunstID -t $timeout -i $iconSound "$title" "$volPercent% $bar\n$media"
else
	dunstify -r $dunstID -t $timeout -i $iconMuted "$title" "Muted"
fi
