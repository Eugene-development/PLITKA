# 🚀 Production Deployment

Готовая к продакшену папка для развертывания приложения на сервере.

---
## Порты
front-4141
admin-4142
api-7143
auth-7144

# 🚚 Как переместить папку на сервер

## 1. Архивируйте папку (опционально)

На вашей локальной машине:

```bash
export COPYFILE_DISABLE=1
tar -czf Srv-front.tar.gz Srv-front
```

## 2. Передайте архив или папку на сервер

### Вариант: Через SCP (рекомендуется)

```bash
scp Srv-front.tar.gz admin@51.250.120.100:/home/admin/Project/PLITKA/
```

## 3. Распакуйте архив на сервере (если передавали архив)

```bash
sudo tar -xzf Srv-front.tar.gz
```

## 4. Удалите архив

```bash
sudo rm Srv-front.tar.gz
```