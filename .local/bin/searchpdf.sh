#!/bin/bash

bookdir="$HOME/Documents/books"
mkdir -p $bookdir
cd $bookdir
fd "$@" -L -t f -e pdf -e epub | rofi -keep-right -dmenu -matching fuzzy -sorting-method fzf -sort -i -p FILES -multi-select | xargs -I {} xdg-open {}
