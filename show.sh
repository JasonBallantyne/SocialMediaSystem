#!/bin/bash

user=$1
./P.sh "$user"
if [ $# -ne 1 ]; then
        echo "Error: parameters problem" >&2
	./V.sh "$user"
        exit 1
elif ! [ -d "$user" ]; then
        echo "$user does not exist" >&2
	./V.sh "$user"
        exit 2
else
        echo "wallStart"
	echo "$(<"$user"/wall)"
	echo "wallEnd"
	./V.sh "$user"
        exit 0
fi
