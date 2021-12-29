#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# cursor fix
xsetroot -cursor_name left_ptr

# monitor refresh rate, set to 75 if possible
xrandr -r 75 > /dev/null 2>&1 || true

# polkit authentication agent
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# gnome keyring
/usr/bin/gnome-keyring-daemon -s &

# dex for xdg-autostart programs
/usr/bin/dex -a &

# screensaver default 10 mins timeout
xset s 600 600

# sets keyboard autorepeat
xset r rate 200 30

# use lock script to lock the screen
xss-lock -- $HOME/.local/bin/lock.sh &
