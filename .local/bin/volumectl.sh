#!/bin/bash

##### USAGE #####
# volumectl.sh: notifies current settings
# volumectl.sh toggle: toggles mute status
# volumectl.sh +{N}: adds N% to volume, where N is an integer
# volumectl.sh -{N}: subtracts N% to volume where N is a positive integer

# configurable variables
sinkname="@DEFAULT_SINK@"

# notify-send arguments
title="Volume"
iconSound="audio-volume-high"
iconMuted="audio-volume-muted"
dunstID=1000
timeout=2000
media=$(mpvtitle.sh)

function is_muted() {
    echo "$(pactl get-sink-mute ${sinkname})"
}

function vol_percent() {
    echo "$(pactl get-sink-volume ${sinkname} | head -n -1 | cut -d '/' -f 2 | tr -cd '[:digit:]')"
}

function notify() {
    percent="$1"
    muted="$2"

    if [[ "$muted" == 'Mute: no' ]]; then
        dunstify \
            -r $dunstID \
            -t $timeout \
            -i $iconSound \
            -h int:value:$percent \
            "$title" "$media"
    else
        dunstify \
            -r $dunstID \
            -t $timeout \
            -i $iconMuted \
            "$title" "Muted"
    fi
}

function min() {
    echo $(($1 < $2 ? $1 : $2))
}

function max() {
    echo $(($1 > $2 ? $1 : $2))
}

# only notify current status if no arguments supplied
if [[ "$#" -eq 0 ]]; then
    notify "$(vol_percent)" "$(is_muted)"

# if toggle, then toggle mute
elif [[ "$1" == "toggle" ]]; then
    pactl set-sink-mute "$sinkname" toggle
    notify "$(vol_percent)" "$(is_muted)"

# if number, then calculate accordingly, limit to 100% max.
# automatically unmutes
elif [[ $1 =~ ^[+-][0-9]+$ ]]; then
    curr_percent="$(vol_percent)"
    percent=$(echo "$curr_percent $1" | bc)
    percent=$(min $percent 100)
    percent=$(max $percent 0)

    pactl set-sink-mute "$sinkname" false
    pactl set-sink-volume "$sinkname" "$percent%"
    notify "$(vol_percent)" "$(is_muted)"

# all other cases are errors
else
    echo "Incorrect usage"
fi
