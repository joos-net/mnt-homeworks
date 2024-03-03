## LIGHTHOUSE + CLICKHOUSE + VECTOR + NGINX
Репозиторий по установке с помощью Ansible Lighthouse + Clickhouse + Vector для мониторинга логов Nginx

## Version
На данный моменет проект имеет версии
- 1.0.0 - CLICKHOUSE + VECTOR + NGINX
- 1.0.1 - CLICKHOUSE + VECTOR + NGINX + описание
- 2.0.0 - LIGHTHOUSE + CLICKHOUSE + VECTOR + NGINX

## Istallation
Подготовка: для установки необходимо указать в /inventory/prod.yml адреса серверов
- Clickhouse
- Lighthouse
- Vector

В процессе выполнения будет установлены:
- EPEL Repo
- Nginx
- Clickhouse (22.3.3.44)
  - создана база (/group_vars/clickhouse/vars.yml - db_name)
  - создана таблица (/group_vars/clickhouse/vars.yml - table_name)
- Vector (0.36.0)
- Lighthouse
- Git

И настроены:
- Clichhouse
  - разрешен доступ со всех ip адресов
- Vector (vector.yml.j2)
  - сбор логов /var/log/nginx/access.log
  - подключение к clickhouse по http://{{ clickhouse-ip }}:8123
- Lighthouse
  - сохранение в /etc/lighthouse
- nginx (nginx.conf.j2)
  - изменение основного пути на /etc/lighthouse
  
## Configure
- Используйте файл /group_vars/clickhouse/vars.yml для изменения значений Clickhouse по умолчанию.
- /group_vars/vector/vars.yml для изменения значений Vector по умолчанию.

## Install
```
ansible-playbook site.yml
```

## Tags
- epel-install - установка epel
- nginx-install - установка nginx
- clickhouse-install - установка clickhouse
- vector-install - установка vector
- git-install - установка git
- lighthouse-install - установка lighthouse

- nginx-config - настройка nginx
- vector-config - настройка vector
