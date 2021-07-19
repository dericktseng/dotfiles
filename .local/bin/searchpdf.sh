#!/bin/bash
fd --type f -e pdf -e epub . | rofi -keep-right -dmenu -matching fuzzy -sort-method fzf -sort -i -p FILES -multi-select | xargs -I {} xdg-open {}
