#!/bin/bash 
#
# Monitors the CPU usage and sends an email alert if it exceeds the threshold (80% in this case).
#
#
set -x
THRESHOLD=80
CPU_LOAD=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}') 
 
if (( $(echo "$CPU_LOAD > $THRESHOLD" | bc -l) )); then 
  echo "High CPU Load: $CPU_LOAD%" | mail -s "Alert: CPU Load" anitodevops@gmail.com 
fi 

