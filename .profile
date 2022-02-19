# cursor fix
if command -v xsetroot &> /dev/null; then
    xsetroot -cursor_name left_ptr
fi

# PATH additions
export PATH=$HOME/.local/bin:$HOME/.cargo/bin:$PATH

# monitor refresh rate, set to 75 if possible
if command -v xrandr &> /dev/null; then
    xrandr -r 75 > /dev/null 2>&1 || true
fi

# polkit authentication agent
/usr/libexec/polkit-gnome-authentication-agent-1 &

# gnome keyring
if command -v gnome-keyring-daemon &> /dev/null; then
    gnome-keyring-daemon -s &
fi

# dex for xdg-autostart programs
if command -v dex-autostart &> /dev/null; then
    dex-autostart -a &
fi

# screensaver default 10 mins timeout
if command -v xset &> /dev/null; then
    # sleep timer
    xset s 600 600

    # sets keyboard autorepeat
    xset r rate 200 30
fi

# use lock script to lock the screen
xss-lock -- $HOME/.local/bin/lock.sh &
