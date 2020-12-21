#!/bin/bash

id="$1"
req="$2"
user="$3"
friend="$4"
message="$5"


if [ "$#" -lt 2 ]; then
	echo "Error: parameters problem" >&2
	exit 1
fi

clientpipe="/home/cs13432788/project-JasonBallantyne/$id.pipe"

mkfifo "$clientpipe"

serverpipe="/home/cs13432788/project-JasonBallantyne/server.pipe"

if [ "$req" = create ]; then
	echo "$id $req $user $friend $message">$serverpipe

elif [[ "$req" = add ]]; then
	echo "$id $req $user $friend $message">$serverpipe

elif [[ "$req" = post ]]; then
	echo "$id $req $user $friend $message">$serverpipe

elif [[ "$req" = show ]]; then
        echo "$id $req $user $friend $message">$serverpipe

elif [[ "$req" = shutdown ]]; then
	echo "$id $req">$serverpipe

fi

while read output; do
	echo "$output"

done<"$clientpipe"
rm "$clientpipe"

