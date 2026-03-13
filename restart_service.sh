#!/bin/bash
#
# Restarts all failed systemd services.
#
for SERVICE in $(systemctl --failed --no-legend | awk '{print $1}');
do
  systemctl restart $SERVICE
done
