#!/usr/bin/env bash

read -p "Enter number of users to be deleted:" num
echo "------------------------------------------------------"
for (( i=1; i<=num; i=i+1)); do
    read -p "Enter Username #$i: " uname
    if userdel -r "$uname" ; then
        echo "------------------------------------------------------"
        echo "Successfully deleted User: $uname"
        echo "------------------------------------------------------"
    fi
done