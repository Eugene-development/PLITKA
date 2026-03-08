#!/bin/bash

# Скрипт остановки Plitka-api

set -e

# Цвета для вывода
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${BLUE}🛑 Остановка Plitka-api...${NC}"

# Проверяем наличие docker-compose.yml
if [ ! -f "docker-compose.yml" ]; then
    echo -e "${YELLOW}⚠️ Переходим в директорию Plitka-api${NC}"
    cd "$(dirname "$0")/.."
fi

# Останавливаем сервисы
echo -e "${YELLOW}⏹️ Останавливаем сервисы...${NC}"
docker-compose --project-name plitka-api down

echo -e "${GREEN}✅ Plitka-api остановлен${NC}"

# Показываем статус
echo -e "${BLUE}📊 Статус контейнеров:${NC}"
docker-compose --project-name plitka-api ps
