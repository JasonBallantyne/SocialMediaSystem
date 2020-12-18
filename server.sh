#!/bin/bash
# Error checking is done within the respective script it calls

mkfifo server.pipe

while true; do
	read -a request < server.pipe


	case "$request" in
		create)
			./create.sh "${arr[@]:1}"
			;;
		add)
			./add.sh "${arr[@]:1}"
			;;
		post)
			./post.sh "${arr[@]:1}"
			;;
		show)
			./show.sh "${arr[@]:1}"
			;;
		shutdown)
			exit 0
			;;
		*)
			echo "Error: bad request"
			exit 1
	esac
done
