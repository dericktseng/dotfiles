#!/bin/sh

# locks the current session with i3-lock with the given settings
lock() {
    i3lock -nek -c "#e3e3e1ff" \
        --insidever-color=fdfdfddd \
        --insidewrong-color=fdfdfddd \
        --inside-color=fdfdfddd \
        --ringver-color=bedcd9dd \
        --ringwrong-color=f3a111dd \
        --ring-color=e2e2e2dd \
        --keyhl-color=083bb9dd \
        --bshl-color=AAAAAAdd \
        --separator-color=00000000 \
        --line-color=00000000 \
        --time-str="%I:%M %p" \
        --indicator \
        --line-uses-inside \
        --date-str="%A, %b %d" \
        --wrong-text="incorrect" \
        --radius=120 \
        --nofork
}

lock
