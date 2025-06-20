#!/bin/bash
set -e

# Stop and remove the 'flask-app' container if it's running
echo "Checking for existing 'flask-app' container..."
CONTAINER_ID=$(sudo docker ps -a -q -f name=flask-app) # -a to check stopped containers too

if [ -n "$CONTAINER_ID" ]; then # -n checks if string is not empty
    echo "Found 'flask-app' container with ID: $CONTAINER_ID. Stopping and removing..."
    sudo docker stop "$CONTAINER_ID" || true # Use '|| true' to prevent script from failing if stop fails
    sudo docker rm "$CONTAINER_ID" || true  # Use '|| true' to prevent script from failing if rm fails
else
    echo "No 'flask-app' container found. Nothing to stop/remove."
fi

# Optional: Also ensure nothing else is on port 5000, just in case (redundant with start_container.sh but safer)
echo "Checking for any other process using port 5000 (non-Docker)..."
PIDS=$(sudo lsof -t -i:5000 || true) # Use || true if lsof might not be installed or finds nothing

if [ -n "$PIDS" ]; then
    echo "Found non-Docker processes on port 5000 with PIDs: $PIDS. Attempting to kill..."
    for PID in $PIDS; do
        sudo kill "$PID" || true
        sleep 1
        sudo kill -9 "$PID" || true # Force kill if necessary
    done
else
    echo "No non-Docker processes found on port 5000."
fi

echo "ApplicationStop cleanup complete."
