#!/bin/bash

# Start the minikube
minikube start
if [ $? -ne 0 ]; then
    echo "Failed to start minikube"
    exit 3
fi    

# Enable ingress addon
minikube addons enable ingress
if [ $? -ne 0 ]; then
    echo "Failed to enable addon ingress"
    exit 3
fi

# Set up docker env on minikube
eval $(minikube docker-env)

# Build Docker image: favtree:1.0
docker build -t favtree:1.0 .
if [ $? -ne 0 ]; then
    echo "Failed to build docker image"
    exit 3
fi

# Apply kubernetes manifest.yaml
kubectl apply -f manifest.yaml

# Wait for public ip to be enabled
sleep 10

# Get minikube ip
MINIKUBE_IP_ADDRESS=$(minikube ip)

if [ "$MINIKUBE_IP_ADDRESS" == "127.0.0.1" ]; then
    echo "Failed to assign minikube ip"
    exit 3
fi

HOST_NAME="local.tree.org"
PORT=80

echo "***** RESULT *****"

# Get the webserver response
curl $MINIKUBE_IP_ADDRESS:$PORT/tree -H Host:$HOST_NAME

echo "***** RESULT *****"
