#!/bin/bash
set -e

# Путь к Plitka-api бэкенду
API_DIR="../ms/plitka-api"
IMAGE_NAME="larux/plitka-api:latest"

cd "$API_DIR"
echo "[plitka-api] Building production image for amd64..."
docker build --platform linux/amd64 -f Dockerfile.production -t $IMAGE_NAME .
echo "[plitka-api] Pushing image to Docker Hub..."
docker push $IMAGE_NAME
echo "[plitka-api] Done!"
