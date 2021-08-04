#!/usr/bin/env bash
# This script requires:
# - that the directory $HOME/.mpv exist 
# - that the program socat be installed
# - that you start mpv with the unix socket feature pointing at that directory
#   I recommend an alias in your .bashrc or equivalent file:
#       alias mpv="mpv --input-unix-socket=$HOME/.mpv/socket"

socket="/tmp/mpvsocket"

sendcmd() {
    # JSON preamble.
    local tosend='{ "command": ['
    # adding in the parameters.
    for arg in "$@"; do
        tosend="$tosend \"$arg\","
    done
    # closing it up.
    tosend=${tosend%?}' ] }'
    # send it along and ignore output.
    # to print output just remove the redirection to /dev/null
    echo $tosend | socat - $socket &> /dev/null
}

addfunc() {
    for video in "$@"; do
        sendcmd 'loadfile' "$video" 'append-play'
    done;
}

# exit mpv
case "$1" in
    "stop"       ) sendcmd 'quit' ;;
    "play-pause" ) sendcmd 'cycle' 'pause' ;;
    "pause"      ) sendcmd 'set' 'pause' 'yes' ;;
    "play"       ) sendcmd 'set' 'pause' 'no' ;;
    "next"       ) sendcmd 'playlist_next' ;;
    "previous"   ) sendcmd 'playlist_prev' ;;
    "add"        ) addfunc "$@" ;;
    *            ) false ;;
esac
