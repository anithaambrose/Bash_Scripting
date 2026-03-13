#!/bin/bash
#
# Moves logs older than 7 days to an archive and compresses them. 
# find $LOG_DIR/*.log -mtime +7 -exec mv {} $ARCHIVE_DIR \;
# 0 -> less than one day old (0-24 hrs)
# +0 -> one day old  (24 hrs)
# +1 -> two days old (48 hrs)
#
set -x
LOG_DIR="/var/log/myapp"
ARCHIVE_DIR="/var/log/myapp/archive"
sudo mkdir -p $ARCHIVE_DIR
sudo touch $LOG_DIR/logfile_{1..10}.log
sudo find $LOG_DIR/*.log -mtime 0 -exec mv {} $ARCHIVE_DIR \;
sudo gzip $ARCHIVE_DIR/*.log


