#!/bin/bash

# Скрипт обновления Plitka-auth

set -e

# Цвета для вывода
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}🔄 Обновление Plitka-auth...${NC}"

# Проверяем наличие docker-compose.yml
if [ ! -f "docker-compose.yml" ]; then
    echo -e "${YELLOW}⚠️ Переходим в директорию Plitka-auth${NC}"
    cd "$(dirname "$0")/.."
fi

# Останавливаем сервисы
echo -e "${YELLOW}🛑 Останавливаем сервисы...${NC}"
docker-compose --project-name plitka-auth down

# Удаляем старые образы
echo -e "${YELLOW}🗑️ Удаляем старые образы...${NC}"
docker-compose --project-name plitka-auth down --rmi all

# Пересобираем образы
echo -e "${BLUE}🔨 Пересобираем образы...${NC}"
docker-compose --project-name plitka-auth build --no-cache

# Запускаем сервисы
echo -e "${BLUE}🚀 Запускаем сервисы...${NC}"
docker-compose --project-name plitka-auth up -d

# Ждем запуска
echo -e "${YELLOW}⏳ Ждем запуска сервисов...${NC}"
sleep 5

# Проверяем статус
if docker-compose --project-name plitka-auth ps | grep -q "Up"; then
    echo -e "${GREEN}✅ Plitka-auth успешно обновлен и запущен!${NC}"
    echo -e "${BLUE}🌐 API доступен по адресу: ${NC}"
    
    # Показываем статус контейнеров
    echo -e "${BLUE}📊 Статус контейнеров:${NC}"
    docker-compose --project-name plitka-auth ps
else
    echo -e "${YELLOW}⚠️ Ошибка запуска. Проверяем логи...${NC}"
    docker-compose --project-name plitka-auth logs
fi
