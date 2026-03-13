#!/bin/bash
#
# Checks if nginx service is down and restarts it automatically.
#
SERVICE="nginx"
if ! systemctl is-active --quiet $SERVICE;then
	echo "$SERVICE is down. Restarting.."
	systemctl start $SERVICE 
else
	echo "$SERVICE is up & running."
fi 
