#!/usr/bin/env bash
# custom wrapper script for launching nnn

# NNN colors
BLOCK_DEVICE="c1"
CHAR_DEVICE="d6"
DIRECTORY="27"
EXECUTABLE="1d"
REGULAR="00"
HARD_LINK="60"
SYMBOLIC_LINK="37"
MISSING="f7"
ORPHANED="c6"
FIFO="d6"
SOCKET="ab"
UNKNOWN="c4"

# NNN bookmarks
dtmp="b:$HOME/Desktop/Derick/tmp/"
h="h:$HOME"
rt="/:/"
docs="z:$HOME/Documents/books"

# NNN Plugins
previewtuiext="p:-preview-tui-ext2"
suedit="s:suedit"
fzopen="f:-fzopen2"
fzcd="d:-fzcd2"
getplugs="u:getplugs"
rsynccp="c:rsynccp"

# NNN configurations
export NNN_FCOLORS="$BLOCK_DEVICE$CHAR_DEVICE$DIRECTORY$EXECUTABLE$REGULAR$HARD_LINK$SYMBOLIC_LINK$MISSING$ORPHANED$FIFO$SOCKET$UNKNOWN"
export NNN_PLUG="$previewtuiext;$suedit;$fzopen;$fzcd;$getplugs;$rsynccp"
export NNN_BMS="$dtmp;$h;$rt;$docs"
export NNN_OPENER="$HOME/.config/nnn/plugins/nuke2"
export NNN_OPTS="ac"
export SPLIT="v"

# check if tmux is already active
if [ -n "$TMUX" ]; then
    /usr/bin/nnn -ae -P p $@
else
    tmux new-session "/usr/bin/nnn -ae -P p $@"
fi
