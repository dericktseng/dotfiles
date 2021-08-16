#!/bin/bash
# look at this -- https://jlk.fjfi.cvut.cz/arch/manpages/man/systemd-inhibit.1.en

# configurable variables


# get id of active window
activ_win_id=""
getWindowId() {
    activ_win_id=$(xprop -root _NET_ACTIVE_WINDOW)
    activ_win_id=${activ_win_id:40:9}
}


# Checks if Active Window is in full screen
is_full_screen=0
checkFullscreen() {
    # Check if Active Window (the foremost window) is in fullscreen state
    isActivWinFullscreen=`xprop -id $activ_win_id | /bin/grep NET_WM_STATE_FULLSCREEN`
    if [[ "$isActivWinFullscreen" = *NET_WM_STATE_FULLSCREEN* ]];then
        is_full_screen=1
    else
        is_full_screen=0
    fi
}


# gets the name of the currently running program
prgm=""
checkRunningProgram() {
    # grabs the last part of WM_CLASS(STRING)
    prgm=$(xprop -id $activ_win_id | /bin/grep 'WM_CLASS(STRING)' | sed -r 's/^.+",\s//' | sed 's/"//g')
}


# resets the screen saver if fullscreen, else, does nothing
resetScreenSaver() {
    if [[ $is_full_screen == 1 ]]  || [[ $prgm == 'zoom' ]] || [[ $prgm == 'qpdfview' ]];then
        xset s reset
    fi
}


# gets the current timeout before screensaver is activated
screen_timeout=600
getCurrentTimeout() {
    screen_timeout=`xset q | grep timeout | cut -d ' ' -f 5`
}

# main program - loops to check if should reset screensaver timer
getCurrentTimeout
while true
do
    getWindowId
    checkFullscreen
    checkRunningProgram
    resetScreenSaver
    sleep $((screen_timeout / 2))
done
