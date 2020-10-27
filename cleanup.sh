#!/bin/bash

# Delete kubernetes objects
kubectl delete deploy/favtree-deployment

kubectl delete svc/favtree-service

kubectl delete ingress/favtree-ingress

sleep 10

# Change the eval of minikube 
eval $(minikube docker-env -u)

# Disable the ingress add on
minikube addons disable ingress

#Stop minikube
minikube stop