# Ansible Roles for Ubuntu 24 — Docker + Nginx + SSH + Users

## Описание
Проект разворачивает тестовое окружение через Docker Compose и настраивает сервер с помощью Ansible ролей.
После выполнения:
- http://localhost/images — структура файлов
- http://localhost/images/<filename> — изображение
- SSH включён

## Структура проекта
.
├── ansible
│   ├── ansible.cfg
│   ├── inventory
│   ├── molecule
│   ├── roles
│   │   ├── nginx
│   │   ├── packages
│   │   ├── ssh
│   │   ├── users
│   │   └── zsh
│   └── site.yml
├── docker-compose.yml
├── Dockerfile
├── README.md

## Запуск
docker compose up -d
ansible-playbook -i ansible/inventory ansible/site.yml

## Роли
users
- создание/удаление пользователей
- оболочка
- состояние
- SSH ключ
- пароль
- группы

zsh
- установка zsh
- установка oh-my-zsh

ssh
- отключён root
- запрещены пустые пароли
- VERBOSE
- отключён X11Forwarding

packages
- обновление
- htop, ncdu, git, nano

nginx
- установка
- gzip
- логирование
- кэш 1 час
- /images и /images/<filename>

static
- копирование статики

## SSH
ssh user@localhost -p 22
