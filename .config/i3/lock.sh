#!/bin/sh

# locks the current session with i3-lock with the given settings
lock() {
    i3lock -nek -c "#e3e3e1ff" \
        --insidevercolor=fdfdfddd \
        --insidewrongcolor=fdfdfddd \
        --insidecolor=fdfdfddd \
        --ringvercolor=bedcd9dd \
        --ringwrongcolor=e77834dd \
        --ringcolor=e2e2e2dd \
        --keyhlcolor=f3a111dd \
        --bshlcolor=AAAAAAdd \
        --separatorcolor=00000000 \
        --linecolor=00000000 \
        --timestr="%I:%M %p" \
        --indicator \
        --line-uses-inside \
        --datestr="%A, %b %d" \
        --wrongtext="incorrect" \
        --radius=120 \
        --nofork
}

lock
