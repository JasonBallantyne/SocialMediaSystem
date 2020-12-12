#!/bin/bash

user=$1
friend=$2

if [ "$#" -ne 2 ]; then
        echo "There is an error with this entry." >&2
        exit 1

elif ! [ -d "$user" ]; then
        echo "This user does not exist on the system." >&2
        exit 2
elif ! [ -d "$friend" ]; then
	echo "This friend does not exist on the system." >&2
	exit 3
elif grep -Fxq "$friend" "$user/friends"; then
	echo "$friend and $user are already friends." >&2
	exit 4
else
	echo "$friend" >> "$user/friends"
	echo "The friend has been added successfully"
	exit 0
fi
