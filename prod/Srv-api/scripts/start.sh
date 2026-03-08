#!/bin/bash

# 🚀 Backend Start Script (Zov-api)
set -e

cd "$(dirname "$0")/.."

echo "🚀 Запуск Backend (Zov-api)..."
echo "=============================="

# Check Docker
if ! command -v docker-compose &> /dev/null; then
    echo "❌ Docker Compose не найден!"
    exit 1
fi

# Start services
echo "🔧 Запуск сервисов..."
docker-compose pull
docker-compose up -d

echo "⏳ Ожидание готовности..."
sleep 10

# Show status
echo "📊 Статус сервисов:"
docker-compose ps

echo "✅ Backend (Zov-api) запущен!"
echo "🌐 API доступен на: (или ваш домен)"
echo "📊 Статус: docker-compose ps"
echo "📋 Логи: docker-compose logs -f"
