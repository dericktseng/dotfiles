#!/bin/bash
fd --type f -e pdf -e epub . $HOME | rofi -keep-right -dmenu -i -p FILES -multi-select | xargs -I {} xdg-open {}
