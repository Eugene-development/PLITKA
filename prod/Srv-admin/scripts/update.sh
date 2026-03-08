#!/bin/bash

# 🔄 Admin Zov Update Script
set -e

cd "$(dirname "$0")/.."

echo "🔄 Обновление Admin (Zov-app)..."
echo "====================================="

# Check Docker
if ! command -v docker-compose &> /dev/null; then
    echo "❌ Docker Compose не найден!"
    exit 1
fi

# Pull latest images
echo "🔧 Загрузка новых образов..."
docker-compose pull

# Recreate containers
echo "🔧 Пересоздание контейнеров..."
docker-compose up -d --force-recreate

echo "⏳ Ожидание готовности..."
sleep 10

# Show status
echo "📊 Статус сервисов:"
docker-compose ps

echo "✅ Admin Zov обновлен!"
