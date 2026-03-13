#!/bin/bash 
#
# Pulls the latest Docker image
# stops the existing container
# removes container 
# then restarts the container with the updated image
#
#
IMAGE="myrepo/myapp:latest" CONTAINER="myapp" 
docker pull $IMAGE 
docker stop $CONTAINER 
docker rm $CONTAINER 
docker run -d --name $CONTAINER -p 80:80 $IMAGE 

