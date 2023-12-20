# /etc/passwd - пользователи
# /etc/group - группы
# /etc/shadow - пароли

id jenya # Инфа о группах пользователя + uid & gid
sudo chage -l jenya # Инфы о настройках пароля пользователя

useradd -D # Настройки по умолчанию при создание пользователя
# /etc/default/useradd - параметры программы useradd
# /etc/login.defs - параметры для всего остального в рамках системы

# Создание пользователей
sudo useradd jeff \
    -b \/home/amazon/it \
    -c "CEO - Bezos I" \
    -g amazon \
    -G sudo \
    -u 1111

sudo useradd bill \
    -b \/home/microsoft/it \
    -c "CEO - Gates I" \
    -g microsoft \
    -G sudo \
    -u 2222 \
    -s /usr/bin/zsh 

sudo passwd jeff # После создания необходимо задать пароль пользователю
chage jeff # Задать настройки пароля для пользователя
grep jeff /etc/passwd /etc/group # Проверить

sudo usermod -s /usr/bin/zsh jeff # Изменить shell по умолчанию у пользователя
sudo chsh -s /usr/bin/zsh jeff # Изменить shell (еще один способ)
sudo usermod bill -d /home/amazon/it/bill -m -aG amazon # Перенести домашнию директорию пользователя и добавить в группу 
sudo userdel -r bill # Удалить пользователя полностью

# Создание групп
sudo groupadd amazon
sudo groupadd microsoft
sudo groupadd google

sudo gpasswd amazon -A jeff # Назначить админа группы
gpasswd -a larry amazon # Админ группы может удалять из группы без sudo
gpasswd -d bill amazon # ... и удалять

sudo usermod -aG google larry # Добавить пользователя в группу