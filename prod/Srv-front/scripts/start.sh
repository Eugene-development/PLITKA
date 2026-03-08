#!/bin/bash

# 🚀 Frontend Start Script
set -e

cd "$(dirname "$0")/.."

echo "🚀 Запуск Frontend (Plitka-app)..."
echo "=================================="

# Check Docker
if ! command -v docker-compose &> /dev/null; then
    echo "❌ Docker Compose не найден!"
    exit 1
fi

# Verify secrets exist
echo "🔍 Проверка секретов..."
required_secrets=("api_base_url" "frontend_url" "auth_api_url")
for secret in "${required_secrets[@]}"; do
    if [[ ! -f "secrets/$secret" ]]; then
        echo "❌ Секрет secrets/$secret не найден!"
        exit 1
    fi
done

# Start services
echo "🔧 Запуск сервисов..."
docker-compose --project-name plitka-front pull
docker-compose --project-name plitka-front up -d

echo "⏳ Ожидание готовности..."
sleep 10

# Show status
echo "📊 Статус сервисов:"
docker-compose --project-name plitka-front ps

echo "✅ Frontend Plitka запущен!"
echo "🌐 App доступен на: http://localhost:4141 (или ваш домен)"
echo "📊 Статус: docker-compose --project-name plitka-front ps"
echo "📋 Логи: docker-compose --project-name plitka-front logs -f"
