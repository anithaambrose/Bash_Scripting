#!/bin/bash
#
#Lists non-running pods in a Kubernetes namespace.
#
NAMESPACE="default"
kubectl get pods -n $NAMESPACE | grep -v Running



