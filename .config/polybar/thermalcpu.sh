#!/bin/bash

info=$(sensors | grep CPUTIN | tail -n 1 | cut -d '+' -f 2 | cut -d ' ' -f 1)

if [[ -z $info ]]; then
    info="$(sensors | grep pch_cannonlake-virtual-0 -A2 | tail -n 1 | cut -d '+' -f 2 | cut -d ' ' -f 1) C"
fi

echo " $info "
