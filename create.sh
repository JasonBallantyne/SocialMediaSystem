#!/bin/bash

if [ "$#" -ne 1 ]; then
	echo "There is an error with this parameter" >&2
	exit 1
fi
user="$1"
if [ -d "$user" ]; then
	echo "This user already exists" >&2
	exit 2
elif [ ! -d "$user" ]; then
	mkdir "user" && touch "$user"/wall "$user"/friends
	echo "User created successfully"
	exit 0
fi
