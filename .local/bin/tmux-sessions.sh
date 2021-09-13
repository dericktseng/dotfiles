#!/bin/bash

output=""

while read -r line; do
	name=$(echo $line | cut -d ':' -f 1)
	if [[ $line == *"(attached)" ]]; then
		name="[*$name]"
	else
		name="[$name]"
	fi

	output="$output$name"
done < <(tmux ls)

echo "${output:0}"
