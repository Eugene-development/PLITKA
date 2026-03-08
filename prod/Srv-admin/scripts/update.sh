#!/bin/bash

# 🔄 Admin Plitka Update Script
set -e

cd "$(dirname "$0")/.."

echo "🔄 Обновление Admin (Plitka-admin)..."
echo "====================================="

# Check Docker
if ! command -v docker-compose &> /dev/null; then
    echo "❌ Docker Compose не найден!"
    exit 1
fi

# Pull latest images
echo "🔧 Загрузка новых образов..."
docker-compose --project-name plitka-admin pull

# Recreate containers
echo "🔧 Пересоздание контейнеров..."
docker-compose --project-name plitka-admin up -d --force-recreate

echo "⏳ Ожидание готовности..."
sleep 10

# Show status
echo "📊 Статус сервисов:"
docker-compose --project-name plitka-admin ps

echo "✅ Admin Plitka обновлен!"
