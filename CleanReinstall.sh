#!/bin/bash

echo "Stop all running containers"
docker compose down --volumes

echo "Remove all unused images, containers, networks and volumes"
docker system prune --volumes --all --force

echo "Update docker-files from GitHub"
git pull

echo """Create and start the containers again in the background (detached)"
docker compose up --detach

echo "All finished. Enjoy your updated version!"
read -p "Press any key to resume ..."
