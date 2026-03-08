#!/bin/bash
set -e

# Путь к Plitka-front бэкенду
API_DIR="../ms/plitka-front"
IMAGE_NAME="larux/plitka-front:latest"

cd "$API_DIR"
echo "[plitka-front] Building production image for amd64..."
docker build --platform linux/amd64 -f Dockerfile.production -t $IMAGE_NAME .
echo "[plitka-front] Pushing image to Docker Hub..."
docker push $IMAGE_NAME
echo "[plitka-front] Done!"
