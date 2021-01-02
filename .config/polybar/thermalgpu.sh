#!/bin/bash
info=$(sensors | grep amdgpu -A 4 | tail -n 1 | cut -d '+' -f 2 | cut -d ' ' -f 1)

if [[ ! -z $info ]]; then
    echo " $info "
fi
