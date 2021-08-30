#!/bin/bash

percent=$(xbacklight -get)

title="Brightness"
icon="brightnesssettings"
dunstID=1001
timeout=2000

dunstify -r $dunstID -t $timeout -i $icon -h int:value:$percent "$title"
