#!/bin/bash

bookdir="$HOME/Documents/books"
roficmd="rofi -keep-right -dmenu -matching fuzzy -sorting-method fzf -sort -i -p FILES -multi-select"
mkdir -p $bookdir
cd $bookdir
fd "$@" -L -t f -e pdf -e epub -e djvu | $roficmd | xargs -I {} xdg-open {}
