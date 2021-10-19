#!/usr/bin/env bash

# desktoprename.sh:
# Script to rename bspwm windows to its corresponding mapping
# defined in names.txt (or whatever is $namefile variable).
# Mainly used for polybar icons.
# Runs as a background process (daemon).

# Dependencies: bspc, ripgrep, xprop, bash

namefile="$HOME/.config/bspwm/names.txt"

cutcmd="cut -d = -f 2"
trcmd="tr -d '[:blank:]'"
rgcmd="rg -N -m 1 -j 1"

function rename_remove() {
    desktopID="$1"
    nodecount=$(bspc query --nodes -d | wc -l)
    # rename back to number if nodecount is zero
    if [ "$nodecount" -eq  "0" ]; then
        # forced to search through array because bspwm
        # sometimes makes its desktop ID skip a number,
        # so just getting the difference between IDs will
        # not always work.
        desktopList=($(bspc query -D))
        for i in "${!desktopList[@]}";do
            if [[ "${desktopList[i]}" = "${desktopID}" ]];then
                bspc desktop "$desktopID" --rename "$(($i + 1))"
            fi
        done
    fi
}

function rename() {
    desktopID="$1"
    nodeID="$2"
    currname="$(bspc query -d "$desktopID" --names -D)"
    classinfo=$(xprop -id "$nodeID" | $rgcmd 'WM_CLASS')
    classname=$(echo "$classinfo" | cut -d '"' -f 2)
    class=$(echo "$classinfo" | cut -d '"' -f 4)

    # use class, then classname as fallback
    # make sure not to include equal sign in the classname or instancename
    # the regex may need to be properly escaped.
    newname=$($rgcmd "^${class}\s*=" $namefile | $cutcmd | $trcmd)
    if [ -z "$newname" ];then
        newname=$($rgcmd "^${classname}\s*=" $namefile | $cutcmd | $trcmd)
    fi

    # renames desktop if newname differs from the desktop's current name
    if [ ! -z "$newname" ] && [ "$newname" != "$currname" ]; then
        bspc desktop "$desktopID" --rename "$newname"
    fi
}

bspc subscribe \
    node_focus \
    node_remove \
    node_transfer | \
    while read -r line; do
        lineArray=($line)
        case "$line" in
            node_focus* )
                desktopID="${lineArray[2]}"
                nodeID="${lineArray[3]}"
                rename "$desktopID" "$nodeID"
                ;;
            node_transfer* )
                desktopIDdst="${lineArray[5]}"
                nodeID="${lineArray[3]}"
                desktopIDsrc="${lineArray[2]}"
                rename "$desktopIDdst" "$nodeID"
                rename_remove "$desktopIDsrc"
                ;;
            node_remove* )
                desktopID="${lineArray[2]}"
                rename_remove "$desktopID"
                ;;
        esac
    done
