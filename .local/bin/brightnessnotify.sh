#!/bin/bash

percent=$(xbacklight -get)
bar=$(seq -s "─" 0 $((percent / 5)) | sed 's/[0-9]//g')

title="Brightness"
icon="brightnesssettings"
dunstID=1001
timeout=2000

dunstify -r $dunstID -t $timeout -i $icon "$title" "$percent% $bar"
