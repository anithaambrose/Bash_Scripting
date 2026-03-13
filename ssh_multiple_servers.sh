#!/bin/bash 
#
# SSHs into multiple servers and runs the uptime command to check system load. 
#
#

SERVERS=("server1" "server2" "server3") 
 
for HOST in "${SERVERS[@]}"
do
	ssh user@$HOST "uptime"
done 

