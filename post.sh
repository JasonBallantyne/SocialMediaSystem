#!/bin/bash

receiver=$1
sender=$2
message=$3

if [ $# -ne 3 ]; then
	echo "There is an incorrect number of parameters" >&2
	exit 1
elif ! [ -d "$receiver" ]; then
	echo "Receiver does not exist" >&2
	exit 2
elif ! [ -d "$sender" ]; then
	echo "Sender does not exist" >&2
	exit 3
elif ! grep -Fxq "$sender" "$receiver"/friends; then
	echo "Sender is not a friend of receiver" >&2
	exit 4 
else
	echo "$sender: $message" >> "$receiver"/wall
	echo "Message has been sent successfully"
	exit 0
fi

