#!/bin/bash
# Error checking is done within the respective script it calls

serverpipe="/home/cs13432788/project-JasonBallantyne/server.pipe"

mkfifo $serverpipe

while true; do
	read -a request < $serverpipe

clientpipe="/home/cs13432788/project-JasonBallantyne/${request[0]}.pipe"

	case "${request[1]}" in
		create)
			./create.sh "${request[@]:2}" &>"$clientpipe"
			;;
		add)
			./add.sh "${request[@]:2}" &>"$clientpipe"
			;;
		post)
			./post.sh "${request[@]:2}" &>"$clientpipe"
			;;
		show)
			./show.sh "${request[@]:2}" &>"$clientpipe"
			;;
		shutdown)
			echo "Shutting down..." &>"$clientpipe"
			rm $serverpipe
			exit 0
			;;
		*)
			echo "Error: bad request"
			rm $serverpipe
			exit 1
	esac

done
rm $serverpipe
