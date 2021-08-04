#!/usr/bin/env bash
if [ -z "$@" ]; then
	allclips=$(clipdel '.*')
	echo -e ".*\n$allclips"
else
	clipdel -d "$@"
fi
