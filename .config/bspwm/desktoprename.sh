#!/usr/bin/env bash

current=$(bspc query -D -d focused --names)
origname=$(echo "$current" | sed 's/[^0-9]//g')
layout=$(bspc query -T -d | jq -r .userLayout)

if [ $layout = "monocle" ]; then
	# rename desktop to INTEGER+
	bspc desktop -n "${origname}+"
else
	# renames desktop to INTEGER
	bspc desktop -n "$origname"
fi
