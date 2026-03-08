#!/bin/bash

# 🛑 Admin Stop Script
set -e

cd "$(dirname "$0")/.."

echo "🛑 Остановка Admin (Plitka-admin)..."
echo "===================================="

# Check Docker
if ! command -v docker-compose &> /dev/null; then
    echo "❌ Docker Compose не найден!"
    exit 1
fi

# Stop services
echo "🔧 Остановка сервисов..."
docker-compose --project-name plitka-admin down

echo "✅ Admin Plitka остановлен!"
