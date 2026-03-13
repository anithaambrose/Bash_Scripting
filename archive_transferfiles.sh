#!/bin/bash 
#
# Archives a project directory into a tarball and transfers it to a remote server. 
# Modify username & ip of remote server.
#
tar -czf project_backup_$(date +%F).tar.gz /var/www/project/ 
scp project_backup_*.tar.gz user@remote:/backups/ 

