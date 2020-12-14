#!/bin/bash

receiver=$1
sender=$2
message=$3

if [ $# -ne 3 ]; then
	echo "Error: parameters problem" >&2
	exit 1
elif ! [ -d "$receiver" ]; then
	echo "Error: $receiver does not exist" >&2
	exit 2
elif ! [ -d "$sender" ]; then
	echo "Error: $sender does not exist" >&2
	exit 3
elif ! grep -Fxq "$sender" "$receiver"/friends; then
	echo "Error: $sender is not a friend of $receiver" >&2
	exit 4 
else
	echo "$sender: $message" >> "$receiver"/wall
	echo "Ok: Message posted to wall"
	exit 0
fi

