## NGINX + CLICKHOUSE + VECTOR
Репозиторий по установке с помощью Ansible Clickhouse + Vector для мониторинга логов Nginx

## Version
На данный моменет проект имеет основную версию 1.0.0

Версия 1.0.1 включает в себя примеры и описание проекта

## Istallation
Подготовка: для установки необходимо указать в /inventory/prod.yml адрес сервера

В процессе выполнения будет установлены:
- EPEL Repo
- Nginx
- Clickhouse (22.3.3.44)
  - создана база (/group_vars/clickhouse/vars.yml - db_name)
  - создана таблица (/group_vars/clickhouse/vars.yml - table_name)
- Vector (0.36.0)

И настроены:
- nginx (nginx.conf.j2)
  - сохранение access.log в /var/log/nginx/my_access.log
- Vector (vector.yml.j2)
  - сбор логов /var/log/nginx/my_access.log
  - подключение к clickhouse по http://127.0.0.1:8123
 
## Configure
Используйте файл /group_vars/clickhouse/vars.yml для изменения значений по умолчанию.

## Install
```
ansible-playbook -i inventory/prod.yml -u <username> site.yml
```

## Tags
- epel-install - установка epel
- nginx-install - установка nginx
- clickhouse-install - установка clickhouse
- vector-install - установка vector

- nginx-config - настройка nginx
- vector-config - настройка vector
