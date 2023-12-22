#!/usr/bin/env bash

if [ "$(id -u)" != 0 ]; then
    echo "Not enough permissions to execute the script" >&2
    exit 1
fi

shell=/sbin/nologin
file=/var/users

if [ -n "$2" ]
then
    user=$1
    group=$2
    echo "Username: $user | Group: $group"
elif [ -f $file ]
then
    user=$(cut -d ' ' -f1 $file)
    group=$(cut -d ' ' -f2 $file)
    echo "Username: $user | Group: $group"
else
    echo Welcome!
    echo "Print username:"
    read -p user
    echo "Print groupname:"
    read -p group
fi

groupadd "$group"

if [ "$group" = it ] || [ "$group" = security ]
then
    if ! grep "%$group" /etc/sudoers;
    then
        cp /etc/sudoers{,.backup}
        echo '%'"$group"' ALL=(ALL:ALL) ALL' >> /etc/sudoers
    fi
    shell=/bin/bash
    
elif [ "$user" = admin ]
then
    if ! grep "$user" /etc/sudoers;
    then
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