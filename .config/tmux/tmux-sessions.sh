#!/bin/bash

output=""

while read -r line; do
    name=$(echo $line | cut -d ':' -f 1)
    current=$(tmux display-message -p '#S')
    if [[ "$name" == "$current" ]]; then
        name=" $name*"
    else
        name=" $name "
    fi

    output="$output$name"
done < <(tmux ls)

echo "${output:0}"
