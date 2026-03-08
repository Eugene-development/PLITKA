#!/bin/bash

# 🚀 Backend Start Script (Plitka-api)
set -e

cd "$(dirname "$0")/.."

echo "🚀 Запуск Backend (Plitka-api)..."
echo "=============================="

# Check Docker
if ! command -v docker-compose &> /dev/null; then
    echo "❌ Docker Compose не найден!"
    exit 1
fi

# Start services
echo "🔧 Запуск сервисов..."
docker-compose --project-name plitka-api pull
docker-compose --project-name plitka-api up -d

echo "⏳ Ожидание готовности..."
sleep 10

# Show status
echo "📊 Статус сервисов:"
docker-compose --project-name plitka-api ps

echo "✅ Backend (Plitka-api) запущен!"
echo "🌐 API доступен на: 7143 (или ваш домен)"
echo "📊 Статус: docker-compose --project-name plitka-api ps"
echo "📋 Логи: docker-compose --project-name plitka-api logs -f"
