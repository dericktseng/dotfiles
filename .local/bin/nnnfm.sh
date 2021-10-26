#!/usr/bin/env bash
# custom wrapper script for launching nnn

# check if tmux is already active
if [ -n "$TMUX" ]; then
    /usr/bin/nnn -ae -P p
else
    tmux new-session "/usr/bin/nnn -ae -P p"
fi
