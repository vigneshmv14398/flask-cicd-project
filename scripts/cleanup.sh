#!/bin/bash
set -e

echo "Cleaning up old app directory..."
mkdir -p /home/ec2-user/flask-app
rm -rf /home/ec2-user/flask-app/*
echo "Cleanup done."
