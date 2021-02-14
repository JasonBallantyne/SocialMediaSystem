# SocialMediaSystem
This is a report based on a basic social media system I have implemented in bash over the course of Winter 2020. 

It is comprised of a create.sh, add.sh, post.sh, show.sh, P.sh, V.sh, client.sh, and server.sh. 
The aim of this social media system is to implement client-server architecture, allowing users (clients) to exchange their public messages on their wall, only with Friends. 
The client will use the client.sh script to execute their query. 
The client.sh will send everything to a server pipe, the server.sh will then read from the server pipe and determine which command is required to run (create, add, post, show, shutdown) and pass the parameters to their dedicated scripts. 

The output of running the appropriate script is then passed back to the client pipe which the client reads from.
This will only work provided the server.sh is up and running (This is due to the serverpipe being created within the server.sh, if the serverpipe is never created, the client.sh cannot pass data to the server pipe). 
If the server is not running, the client.sh will forever be left hanging until the server.sh is initialised.
