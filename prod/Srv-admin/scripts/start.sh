#!/bin/bash

# 🚀 Frontend Start Script
set -e

cd "$(dirname "$0")/.."

echo "🚀 Запуск Frontend (SvelteKit App)..."
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
docker-compose pull
docker-compose up -d

echo "⏳ Ожидание готовности..."
sleep 10

# Show status
echo "📊 Статус сервисов:"
docker-compose ps

echo "✅ Frontend Zov запущен!"
echo "🌐 App доступен на: http://localhost:4413 (или ваш домен)"
echo "📊 Статус: docker-compose ps"
echo "📋 Логи: docker-compose logs -f"
