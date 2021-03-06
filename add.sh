#!/bin/bash

user=$1
friend=$2
./P.sh "$user"
./P.sh "$friend"
if [ "$#" -ne 2 ]; then
        echo "Error: parameters problem" >&2
	./V.sh "$user"
	./V.sh "$friend"
        exit 1

elif ! [ -d "$user" ]; then
        echo "Error: $user does not exist" >&2
	./V.sh "$user"
        ./V.sh "$friend"
        exit 2
elif ! [ -d "$friend" ]; then
	echo "Error: $friend does not exist" >&2
	./V.sh "$user"
        ./V.sh "$friend"
	exit 3
elif grep -Fxq "$friend" "$user/friends"; then
	echo "Error: $user is already friends with $friend" >&2
	./V.sh "$user"
        ./V.sh "$friend"
	exit 4
else
	echo "$friend" >> "$user/friends"
	echo "OK: friend added"
	./V.sh "$user"
        ./V.sh "$friend"
	exit 0
fi
