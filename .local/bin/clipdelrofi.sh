#!/usr/bin/env bash
if [ -z "$@" ]; then
	clipmenu | clipdel -d
else
	clipdel -d "$@"
fi
