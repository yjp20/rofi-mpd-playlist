#!/usr/bin/env bash

DELIMITER=" - "

if [ ! -z "$@" ]; then
	QUERY=$(echo "$@" | sed "s/${DELIMITER}/\t/g")
	ARTIST=$(echo "$QUERY" | cut -f 1)
	TITLE=$(echo "$QUERY" | cut -f 2)
	mpc -q searchplay artist "$ARTIST" title "$TITLE"
	exit
fi

mpc --format="%artist%${DELIMITER}%title%" playlist
