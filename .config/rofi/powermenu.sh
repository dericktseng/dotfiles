#!/usr/bin/env bash

rofi_command="rofi"

# Options
ishutdown=""
ireboot=""
ilock=""
isuspend="鈴"
ilogout=""

# Variable passed to rofi
options="$ishutdown\n$ireboot\n$ilock\n$isuspend\n$ilogout"

chosen="$(echo -e "$options" | $rofi_command -p "POWER MENU" -dmenu -selected-row 2)"
case $chosen in
    $ishutdown)
        systemctl poweroff
        ;;
    $ireboot)
        systemctl reboot
        ;;
    $ilock)
        loginctl lock-session
        ;;
    $isuspend)
        mpc -q pause
        amixer set Master mute
        systemctl suspend
        ;;
    $ilogout)
        loginctl terminate-user "$(whoami)"
        ;;
esac
