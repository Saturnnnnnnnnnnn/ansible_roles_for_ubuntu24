FROM ubuntu:24.04

# Обновление и установка необходимых пакетов
RUN apt-get update && apt-get install -y \
    openssh-server \
    sudo \
    nginx \
    curl \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Создаем пользователя ansible
RUN useradd -rm -d /home/ansible -s /bin/bash -g root -G sudo -u 1001 ansible && \
    echo 'ansible:ansible' | chpasswd

# Разрешаем sudo без пароля для пользователя ansible
RUN echo "ansible ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Настроим SSH
RUN mkdir /var/run/sshd
RUN echo 'PermitRootLogin no' >> /etc/ssh/sshd_config  # Отключаем root login
EXPOSE 22

# Установим Nginx
RUN mkdir -p /var/www/images

# Откроем порты для Nginx
EXPOSE 80

# Запуск SSH и Nginx
CMD service ssh start && nginx -g 'daemon off;'
