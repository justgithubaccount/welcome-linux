# https://basis.gnulinux.pro/ru/latest/basis/17/17._su.html
# https://basis.gnulinux.pro/ru/latest/basis/18/18._sudo.html

# Посчитать кол-во строк в данном случае пользователей в системе
wc -l /etc/passwd

# Выполнение команды от имени суперпользователя (cоздание пользователя)
sudo useradd cloud
sudo passwd cloud

# Позволяет менять текущего пользователя или запускать команды от имени другого пользователя
su cloud # Зайти под пользователем cloud
su # Если отправить пустую команду можно зайти под root пользователем
su - cloud # без указания - переменные окружения остаются от предыдущего пользователя

# Узнать какой сейчас текущий shell (login-shell или non-login-shell)
# При login-shell значение будет bash при non-login-shell -bash
echo $0

# Запуск команд
su cloud -c "touch file1"
su - cloud -c "touch file1"

# Редактирование sudo стоит делать делать только используяю команду visudo
# visudo создает временный файл для того чтобы в случай ошибки, предупредить что есть ошибка
sudo visudo 

# Стать рутом не знаю пароль рут пользователя
sudo su

# Нужно было для того чтобы зайти под пользователем jenkins через vagrant (на память)
cd ../jenkins-srv
vagrant ssh 
sudo -i
su - jenkins