#!/bin/bash
#
# Monitor System Load and Send Alerts.
#
#
set -x
THRESHOLD=80
LOAD=$(uptime | awk -F'load average: ' '{ print $2 }' | cut -d, -f1 | tr -d ' ')
if (( $(echo "$LOAD > $THRESHOLD" | bc -l) )); then
	echo "High system load: $LOAD" | mail -s "Alert: High System Load" anitodevops@gmail.com
fi
