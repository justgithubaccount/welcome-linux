#!/usr/bin/env bash

# Проверка запуска от рута 
if [ "$(id -u)" != 0 ]; then
    echo "Not enough permissions to execute the script" >&2
    exit 1
fi

listUsers=./scr-data/users-list.csv
saveIFS=$IFS # Сохранение текущего разделителя (для cut)

# Функция для проверки существования пользователя
isUserExists() {
    local user=$1
   
    checkUser=$(cut -d : -f1 /etc/passwd | grep -w "$user")

    if [ -z "$checkUser" ]; then
        return 0
    else
        return 1
    fi
}

# Генерация уникального имени (в случае считывания данных из файла)
generateUniqueUserName() {
    local firstName=$1
    local lastName=$2
    local i=1
   
    while true; do
        user="${firstName:0:$i}.$lastName"
       
        if isUserExists "$user"; then
            echo "$user"
            break
        fi
       
        ((i++))

        if [ "$i" -gt "${#firstName}" ]; then
            return 1
        fi
    done

    return 0
}

# Функция создания пользователя
createUser() {
    local user=$1
    local group=$2

    IFS=$saveIFS
    shell=/sbin/nologin
    
    groupadd "$group"
    
    if [ "$group" = it ] || [ "$group" = security ]; then
        if ! grep "%$group" /etc/sudoers; then
            cp /etc/sudoers{,.backup}
            echo '%'"$group"' ALL=(ALL:ALL) ALL' >> /etc/sudoers
        fi
        shell=/bin/bash
        
    elif [ "$user" = admin ]; then
        if ! grep "$user" /etc/sudoers; then
            cp /etc/sudoers{,.backup}
            echo '%'"$user"' ALL=(ALL:ALL) ALL' >> /etc/sudoers
        fi
        shell=/bin/bash
    fi
    
    mkdir -v /home/"$group"
    
    useradd "$user" \
    -g "$group" \
    -b /home/"$group" \
    -s $shell
}

if [ -n "$2" ]; then
    user=$1
    group=$2
    echo "Username: $user | Group: $group"
    createUser "$user" "$group"
elif [ -f $listUsers ]; then
    IFS=$'\n'
    # Обработка .csv файла
    users=$(cut -d , -f1,2,4 $listUsers | tail -n +2 | tr '[:upper:]' '[:lower:]' | tr , ' ')

    for line in $users; do
        firstName=$(echo "$line" | cut -d ' ' -f1)
        lastName=$(echo "$line" | cut -d ' ' -f2)

        user=$(generateUniqueUserName "$firstName" "$lastName")

        if [ -z "$user" ]; then
            echo "Unable to create a user"
            continue
        fi

        group=$(echo "$line" | cut -d ' ' -f3)

        echo "Username: $user | Group: $group"
        createUser "$user" "$group"
    done
else
    echo Welcome!
    select option in "Add user" "Show user" "Exit"; do
        case $option in
            "Add user")
                read -p "Print username: " user
                read -p "Print groupname: " group
                createUser "$user" "$group" ;;
            "Show user")
                cut -d : -f1 /etc/passwd ;;
            "Exit")
                break ;;
            *)
                echo "Wrong optins" ;;
        esac
    done
fi