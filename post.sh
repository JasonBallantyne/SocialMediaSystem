#!/bin/bash

receiver=$1
sender=$2
message=$3
./P.sh "$receiver"
./P.sh "$sender"
./P.sh "$message"
if [ $# -ne 3 ]; then
	echo "Error: parameters problem" >&2
	./V.sh "$receiver"
	./V.sh "$sender"
	./V.sh "$message"
	exit 1
elif ! [ -d "$receiver" ]; then
	echo "Error: $receiver does not exist" >&2
	./V.sh "$receiver"
        ./V.sh "$sender"
        ./V.sh "$message"
	exit 2
elif ! [ -d "$sender" ]; then
	echo "Error: $sender does not exist" >&2
	./V.sh "$receiver"
        ./V.sh "$sender"
        ./V.sh "$message"
	exit 3
elif ! grep -Fxq "$sender" "$receiver"/friends; then
	echo "Error: $sender is not a friend of $receiver" >&2
	./V.sh "$receiver"
        ./V.sh "$sender"
        ./V.sh "$message"
	exit 4 
else
	echo "$sender: $message" >> "$receiver"/wall
	echo "Ok: Message posted to wall"
	./V.sh "$receiver"
        ./V.sh "$sender"
        ./V.sh "$message"
	exit 0
fi

