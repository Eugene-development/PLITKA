#!/bin/bash
set -e

# Путь к Plitka-auth бэкенду
AUTH_DIR="../ms/plitka-auth"
IMAGE_NAME="larux/plitka-auth:latest"
    
cd "$AUTH_DIR"
echo "[plitka-auth] Building production image for amd64..."
docker build --platform linux/amd64 -f Dockerfile.production -t $IMAGE_NAME .
echo "[plitka-auth] Pushing image to Docker Hub..."
docker push $IMAGE_NAME
echo "[plitka-auth] Done!"
