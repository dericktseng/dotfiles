#!/bin/bash
failmsg=""
query='{ "command": ["get_property", "media-title"] }'
mpvsock=/tmp/mpvsocket
output=$(echo $query | socat - $mpvsock 2> /dev/null || echo "$failmsg")

if [[ "$output" != "$failmsg" ]]; then
	title=$(echo "$output" | jq -Mcr '.data')
	output="$title"
fi

echo $output
