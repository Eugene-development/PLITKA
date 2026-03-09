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
tar -czf Srv-admin.tar.gz Srv-admin
```

## 2. Передайте архив или папку на сервер

### Вариант: Через SCP (рекомендуется)

```bash
scp Srv-admin.tar.gz admin@51.250.120.100:/home/admin/Project/PLITKA/
```

## 3. Распакуйте архив на сервере (если передавали архив)

```bash
sudo tar -xzf Srv-admin.tar.gz
```

## 4. Удалите архив

```bash
sudo rm Srv-admin.tar.gz
```