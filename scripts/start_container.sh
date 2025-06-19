#!/bin/bash
set -e

# Pull the Docker image from Docker Hub
docker pull vigneshmv14398/flask-cicd-app

# Run the Docker image as a container 
docker run -d -p 5000:5000 vigneshmv14398/flask-cicd-app   
