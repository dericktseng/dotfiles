#!/usr/bin/env bash

rofi_command="rofi -theme powermenu.rasi"

# Options
shutdown=" shutdown"
reboot=" reboot"
lock=" lock"
hibernate="⏾ hibernate"
suspend="鈴 suspend"
logout=" logout"

# Variable passed to rofi
options="$shutdown\n$reboot\n$lock\n$hibernate\n$suspend\n$logout"

chosen="$(echo -e "$options" | $rofi_command -p "POWER MENU" -dmenu -selected-row 0)"
case $chosen in
    $shutdown)
        systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
    $lock)
        loginctl lock-session
        ;;
    $suspend)
        amixer set Master mute
        systemctl suspend
        ;;
    $hibernate)
        systemctl hibernate
        ;;
    $logout)
        loginctl terminate-user "$(whoami)"
        ;;
esac
