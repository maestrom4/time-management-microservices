#!/bin/bash

# Stop all containers
echo "Stopping all Docker containers..."
docker stop $(docker ps -a -q)

# Remove all containers
echo "Removing all Docker containers..."
docker rm $(docker ps -a -q)

# Remove all images
echo "Removing all Docker images..."
docker rmi $(docker images -q)

# Prune system to remove unused data
echo "Pruning Docker system..."
docker system prune -af

# Remove volumes
echo "Removing all Docker volumes..."
docker volume prune -f

# Remove networks
echo "Removing all Docker networks..."
docker network prune -f

echo "Docker cleanup complete."
