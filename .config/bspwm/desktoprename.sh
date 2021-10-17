#!/usr/bin/env bash
namefile="$HOME/.config/bspwm/names.txt"

cutcmd="cut -d = -f 2"
trcmd="tr -d '[:blank:]'"
rgcmd="rg -N -m 1 -j 1"

function rename_remove() {
    desktopID="$1"
    nodecount=$(bspc query --nodes -d | wc -l)
    # rename back to number if nodecount is zero
    if [ "$nodecount" -eq  "0" ]; then
        firstdesktop=$(bspc query --desktops | head -n 1)
        index=$(($desktopID - $firstdesktop + 1))
        bspc desktop "$desktopID" --rename "$index"
    fi
}

function rename() {
    desktopID="$1"
    nodeID="$2"
    classname="$(bspc query -T -n "$nodeID" | \
        jq -r '.client.className' | \
        sed -e 's/[\&.^]/\\&/g')"
    instancename="$(bspc query -T -n "$nodeID" | \
        jq -r '.client.instanceName' | \
        sed -e 's/[\&.^]/\\&/g')"
    currname="$(bspc query -d "$desktopID" --names -D)"

    # use instancename, then classname as fallback
    # make sure not to include equal sign in the classname or instancename
    newname=$($rgcmd "^${instancename}\s*=" $namefile | $cutcmd | $trcmd)
    if [ -z "$newname" ];then
        newname=$($rgcmd "^${classname}\s*=" $namefile | $cutcmd | $trcmd)
    fi

    # outputs unknown to /tmp/unknown.txt
    # [ "$newname" = "null" ] && bspc query -T -n "$nodeID" >> /tmp/unknown.txt

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
        case "$line" in
            node_focus* )
                desktopID=$(echo "$line" | cut -d ' ' -f 3)
                nodeID=$(echo "$line" | cut -d ' ' -f 4)
                rename "$desktopID" "$nodeID"
                ;;
            node_transfer* )
                desktopIDdst=$(echo "$line" | cut -d ' ' -f 6)
                nodeID=$(echo "$line" | cut -d ' ' -f 4)
                desktopIDsrc=$(echo "$line" | cut -d ' ' -f 3)
                rename "$desktopIDdst" "$nodeID"
                rename_remove "$desktopIDsrc"
                ;;
            node_remove* )
                desktopID=$(echo "$line" | cut -d ' ' -f 3)
                rename_remove "$desktopID"
                ;;
        esac
    done
