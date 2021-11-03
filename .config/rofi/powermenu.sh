#!/usr/bin/env bash

rofi_command="rofi -theme powermenu.rasi"

# Options
ishutdown=" shutdown"
ireboot=" reboot"
ilock=" lock"
isuspend="鈴 suspend"
ilogout=" logout"

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
        amixer set Master mute
        systemctl suspend
        ;;
    $ilogout)
        loginctl terminate-user "$(whoami)"
        ;;
esac
