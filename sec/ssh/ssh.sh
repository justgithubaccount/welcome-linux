# Генерация ключей (private и public)
ssh-keygen -t rsa

# Копирование public ключа на нужный хост
ssh-copy-id -i ~/.ssh/rsa-huawei-home.pub root@185.93.109.137

# Подключение к хосту используя private ключ
ssh -i ./rsa-huawei-home 'root@185.93.109.137'
ssh root@185.93.109.137 # Когда private ключ называется id_rsa

# Подключение с параметрами из ~/.ssh/config
ssh net-angels-vds

# Смена разрешений чтобы никто из группы не смог изменить этот файл
chmod 0644 ~/.ssh/config

# Смена разрешений чтобы был доступ только для владельца
chmod 0600 ~/.ssh/authorized_keys
chmod 0600 ~/.ssh/id_rsa

# Конфиг файл демона ssh
nano /etc/ssh/sshd_config

systemctl status sshd
systemctl restart sshd