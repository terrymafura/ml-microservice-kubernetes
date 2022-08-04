#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath="maffsojah/ml-microservice"

# Step 2
# Run the Docker Hub container with kubernetes
kubectl get nodes
kubectl create deploy ml-microservice --image=maffsojah/ml-microservice:v1.0.0
kubectl get deploy

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
export POD_NAME=$(kubectl get pods --template '{{range .items}}{{.metadata.name}}{{end}}' --selector=app=ml-microservice)
kubectl port-forward pod/$POD_NAME --address 0.0.0.0 8000:80
kubectl logs $POD_NAME
