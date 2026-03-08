#!/bin/bash

# 🚀 Backend Start Script (Plitka-auth)
set -e

cd "$(dirname "$0")/.."

echo "🚀 Запуск Backend (Plitka-auth)..."
echo "=============================="

# Check Docker
if ! command -v docker-compose &> /dev/null; then
    echo "❌ Docker Compose не найден!"
    exit 1
fi
    
# Start services
echo "🔧 Запуск сервисов..."
docker-compose --project-name plitka-auth pull
docker-compose --project-name plitka-auth up -d

echo "⏳ Ожидание готовности..."
sleep 10

# Show status
echo "📊 Статус сервисов:"
docker-compose --project-name plitka-auth ps

echo "✅ Backend (Plitka-auth) запущен!"
echo "🌐 API доступен на: 7144 (или ваш домен)"
echo "📊 Статус: docker-compose --project-name plitka-auth ps"
echo "📋 Логи: docker-compose --project-name plitka-auth logs -f"
