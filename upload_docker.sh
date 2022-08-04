#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
dockerpath="maffsojah/ml-microservice"

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
docker tag ml-microservice maffsojah/ml-microservice:v1.0.0
docker images
docker login

# Step 3:
# Push image to a docker repository
docker push maffsojah/ml-microservice:v1.0.0