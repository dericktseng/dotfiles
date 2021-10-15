#!/usr/bin/env bash

# creates new tmux session on startup for each folder if it does not exist.
directories=(
	"$HOME/Desktop/Berkeley/3/2021Fall/e40/"
	"$HOME/Desktop/Berkeley/3/2021Fall/ee105/"
	"$HOME/Desktop/Berkeley/3/2021Fall/mse102/"
	"$HOME/Desktop/Berkeley/3/2021Fall/mse113/"
)

for directory in "${directories[@]}"; do
	sessionname=$(basename "$directory")
	if ! tmux has-session -t "$sessionname" 2> /dev/null; then
		tmux new-session -d -s "$sessionname" -c "$directory"
	fi
done
