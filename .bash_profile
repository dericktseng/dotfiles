#
# ~/.bash_profile
#
eval $(dircolors)
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

