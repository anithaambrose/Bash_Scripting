#!/bin/bash
#
# Frees disk space by removing unused Docker containers, images, and volumes. 
# run commands everytime with sudo priveledge or add the docker to ubuntu group 
#
sudo usermod -aG docker ubuntu  
sudo docker container prune -f
sudo docker image prune -f 
sudo docker volume prune -f 


