#!/bin/bash
set -e

# Путь к Plitka-admin бэкенду
API_DIR="../ms/plitka-admin"
IMAGE_NAME="larux/plitka-admin:latest"

cd "$API_DIR"
echo "[plitka-admin] Building production image for amd64..."
docker build --platform linux/amd64 -f Dockerfile.production -t $IMAGE_NAME .
echo "[plitka-admin] Pushing image to Docker Hub..."
docker push $IMAGE_NAME
echo "[plitka-admin] Done!"
