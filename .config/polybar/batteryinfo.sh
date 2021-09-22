#!/bin/bash

if [[ "$1" == '--time' ]]; then
	notify-send -t 1500 BATTERY "$(acpi -b | cut -d ',' -f 3)"
else
	notify-send -t 1500 BATTERY "$(acpi -b)"
fi
