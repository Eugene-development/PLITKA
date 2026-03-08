#!/bin/bash

# 🛑 Frontend Stop Script
set -e

cd "$(dirname "$0")/.."

echo "🛑 Остановка Frontend (SvelteKit App)..."
echo "===================================="

# Check Docker
if ! command -v docker-compose &> /dev/null; then
    echo "❌ Docker Compose не найден!"
    exit 1
fi

# Stop services
echo "🔧 Остановка сервисов..."
docker-compose --project-name plitka-front down

echo "✅ Frontend Zov остановлен!"
