#!/bin/bash
set -e

# Ensure docker is in PATH and running
export PATH=$PATH:/usr/bin
sudo systemctl start docker

# Pull latest image and run container
docker pull vigneshmv14398/flask-cicd-app
docker stop flask-app || true
docker rm flask-app || true
docker run -d --name flask-app -p 5000:5000 vigneshmv14398/flask-cicd-app
