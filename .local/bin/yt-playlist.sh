#!/bin/bash
session_name="music"
musicdir="$HOME/Music/local"
url='https://www.youtube.com/playlist?list=PLUcR4qhATg8sMIikByQq25NEQvWsQ52Yg'
volume=100
ipcsock="/tmp/mpvsocket"

mpvcmd="mpv --volume=$volume --no-video --shuffle --no-resume-playback --input-ipc-server=$ipcsock"

function start_session() {
    if [[ $# -ne 0 ]]; then
		tmux new-session -d -s $session_name "$mpvcmd '$@'" > /dev/null
	elif [ -d $musicdir ]; then
		tmux new-session -d -s $session_name "$mpvcmd '$musicdir'" > /dev/null
	else
		tmux new-session -d -s $session_name "$mpvcmd '$url'" > /dev/null
    fi
}

function attach_session() {
    tmux attach-session -t $session_name
}

tmux has-session -t $session_name 2>/dev/null
if [[ $? -ne 0 ]]; then
    start_session $@
else
    attach_session
fi
