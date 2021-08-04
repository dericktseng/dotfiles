#!/bin/bash

info=$(sensors | grep 'k10temp-pci-00c3' -A2 | tail -n 1 | cut -d '+' -f 2 | cut -d ' ' -f 1)

if [[ -z $info ]]; then
    info="$(sensors | grep pch_cannonlake-virtual-0 -A2 | tail -n 1 | cut -d '+' -f 2 | cut -d ' ' -f 1)"
fi

echo "$info"
