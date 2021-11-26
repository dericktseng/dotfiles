#!/bin/bash

sinkname="@DEFAULT_SINK@"
volPercent="$(pactl get-sink-volume ${sinkname} | cut -d ' ' -f 6 | tr -cd '[:digit:]')"
isMuted="$(pactl get-sink-mute ${sinkname})"

title="Volume"
iconSound="audio-volume-high"
iconMuted="audio-volume-muted"
dunstID=1000
timeout=2000
media=$(mpvtitle.sh)

if [[ "$isMuted" == 'Mute: no' ]]; then
	dunstify \
        -r $dunstID \
        -t $timeout \
        -i $iconSound \
        -h int:value:$volPercent \
        "$title" "$media"
else
	dunstify \
        -r $dunstID \
        -t $timeout \
        -i $iconMuted \
        "$title" "Muted"
fi
