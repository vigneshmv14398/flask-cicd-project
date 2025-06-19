#!/bin/bash
set -e

# Start Docker if not running
sudo systemctl start docker

# Find and kill any container using port 5000
EXISTING=$(sudo docker ps --filter "publish=5000" --format "{{.ID}}")

if [ "$EXISTING" != "" ]; then
    echo "Killing container using port 5000: $EXISTING"
    sudo docker stop "$EXISTING"
    sudo docker rm "$EXISTING"
fi

# Pull latest image
docker pull vigneshmv14398/flask-cicd-app

# Run new container
docker run -d --name flask-app -p 5000:5000 vigneshmv14398/flask-cicd-app
