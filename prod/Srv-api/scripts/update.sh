#!/bin/bash

# Скрипт обновления Plitka-api

set -e

# Цвета для вывода
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}🔄 Обновление Plitka-api...${NC}"

# Проверяем наличие docker-compose.yml
if [ ! -f "docker-compose.yml" ]; then
    echo -e "${YELLOW}⚠️ Переходим в директорию Plitka-api${NC}"
cd "$(dirname "$0")/.."
fi

# Останавливаем сервисы
echo -e "${YELLOW}🛑 Останавливаем сервисы...${NC}"
docker-compose --project-name plitka-api down

# Удаляем старые образы
echo -e "${YELLOW}🗑️ Удаляем старые образы...${NC}"
docker-compose --project-name plitka-api down --rmi all

# Пересобираем образы
echo -e "${BLUE}🔨 Пересобираем образы...${NC}"
docker-compose --project-name plitka-api build --no-cache

# Запускаем сервисы
echo -e "${BLUE}🚀 Запускаем сервисы...${NC}"
docker-compose --project-name plitka-api up -d

# Ждем запуска
echo -e "${YELLOW}⏳ Ждем запуска сервисов...${NC}"
sleep 5

# Проверяем статус
if docker-compose --project-name plitka-api ps | grep -q "Up"; then
    echo -e "${GREEN}✅ Plitka-api успешно обновлен и запущен!${NC}"
    echo -e "${BLUE}🌐 API доступен по адресу: ${NC}"
    
    # Показываем статус контейнеров
    echo -e "${BLUE}📊 Статус контейнеров:${NC}"
    docker-compose --project-name plitka-api ps
else
    echo -e "${YELLOW}⚠️ Ошибка запуска. Проверяем логи...${NC}"
    docker-compose --project-name plitka-api logs
fi
