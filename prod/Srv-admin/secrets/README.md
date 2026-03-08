# Frontend Secrets Configuration

Данная папка содержит конфиденциальные файлы для приложения Frontend.

## Необходимые файлы:

- `api_base_url` - URL GraphQL API сервера для получения данных (b5-api2)
- `frontend_url` - URL фронтенда приложения 
- `auth_api_url` - URL API для авторизации пользователей (b5-auth-2)

## Создание файлов:

```bash
echo "https://novostroy.org" > frontend_url # URL фронтенда приложения
echo "https://api.novostroy.org" > api_base_url
echo "https://auth.novostroy.org" > auth_api_url # URL API для авторизации пользователей
```

## Безопасность:

- Файлы не должны попадать в git
- Используйте переменные окружения в production
- Регулярно ротируйте секреты
