#!/bin/bash
#
# Define the service to monitor
#
#
SERVICE="nginx"

# Check if the service is running
if ! systemctl is-active --quiet $SERVICE; then
	# Restart the service if it's not running
	sudo systemctl restart $SERVICE
	echo "$SERVICE was not running. It has been restarted."
else
	echo "$SERVICE is running normally."
fi
