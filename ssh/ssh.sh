# Генерим ключи
ssh-keygen

# Копируем ключи на нужный хост
ssh-copy-id root@127.0.0.1

# Конфиг файл демона ssh
nano /etc/ssh/sshd_config

systemctl status sshd
systemctl restart sshd

# Подключение с параметрами из ~/.ssh/config
ssh net-angels-vds

# Смена разрешений чтобы никто из группы не смог изменить этот файл
chmod 644 ~/.ssh/config