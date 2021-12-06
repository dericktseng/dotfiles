#!/usr/bin/env bash
directories=(
	"$HOME/Desktop/current/"
	"$HOME/Desktop/Derick/program/"
)

if [[ $# -eq 1 ]]; then
	selected=$1
else
	selected=$(fd -t d -L --exact-depth 1 . "${directories[@]}" | fzf-tmux --delimiter / --with-nth -2..-1 )
fi

if [[ -z $selected ]]; then
	exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)
if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
	tmux new-session -s $selected_name -c $selected
	exit 0
fi

if ! tmux has-session -t $selected_name 2> /dev/null; then
	tmux new-session -ds $selected_name -c $selected
fi

if [[ -z $TMUX ]]; then
	tmux attach-session -t $selected_name
else
	tmux switch-client -t $selected_name
fi

tmux refresh-client -S
