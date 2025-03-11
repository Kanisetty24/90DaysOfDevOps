#!/bin/bash
set -e

echo "Creating a temp working directory..."
mkdir -p day23 && cd day23

echo "Downloading only docker-compose.yaml from GitHub..."
curl -o docker-compose.yaml https://raw.githubusercontent.com/Kanisetty24/90DaysOfDevOps/master/2025/day23/docker-compose.yaml

echo "Starting services using docker-compose..."
docker compose up -d

#Optional: Wait or do something while containers are running
sleep 30

echo "Cleaning up containers after use..."
docker compose down
