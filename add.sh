#!/bin/bash

user=$1
friend=$2

if [ "$#" -ne 2 ]; then
        echo "Error: parameters problem" >&2
        exit 1

elif ! [ -d "$user" ]; then
        echo "Error: $user does not exist" >&2
        exit 2
elif ! [ -d "$friend" ]; then
	echo "Error: $friend does not exist" >&2
	exit 3
elif grep -Fxq "$friend" "$user/friends"; then
	echo "Error: $user is already friends with $friend" >&2
	exit 4
else
	echo "$friend" >> "$user/friends"
	echo "OK: friend added"
	exit 0
fi
