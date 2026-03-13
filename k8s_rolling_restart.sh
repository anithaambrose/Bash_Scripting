#!/bin/bash 
#
# Triggers a rolling restart of a Kubernetes deployment. 
# Use : to apply changes to a deployment (like new code) without downtime. 
#
#
DEPLOYMENT="myapp" 
NAMESPACE="default" 
kubectl rollout restart deployment $DEPLOYMENT -n $NAMESPACE 

