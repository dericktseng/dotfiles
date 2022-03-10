#!/bin/bash

currbrightness=$(brightnessctl g)
maxbrightness=$(brightnessctl m)
percent=$(echo "$currbrightness * 100 / $maxbrightness" | bc)

title="Brightness"
icon="brightnesssettings"
dunstID=1001
timeout=2000

dunstify -r $dunstID -t $timeout -i $icon -h int:value:$percent "$title"
