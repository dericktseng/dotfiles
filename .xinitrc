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

# screen locker
xset s on
xset s 600

# cursor fix
xsetroot -cursor_name left_ptr

# compositor
picom --config $HOME/.config/picom/picom.conf -b --experimental-backends

# import display
systemctl --user import-environment DISPLAY

# monitor refresh rate, set to 75 if possible
xrandr -r 75 > /dev/null 2>&1 || true

# start WM
lock.sh
exec bspwm
