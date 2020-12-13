#!/bin/bash

user=$1

if [ $# -ne 1 ]; then
        echo "There is an incorrect number of parameters" >&2
        exit 1
elif ! [ -d "$user" ]; then
        echo "User does not exist" >&2
        exit 2
else
        echo "wallStart"
	echo "$(<"$user"/wall)"
	echo "wallEnd"
        exit 0
fi
