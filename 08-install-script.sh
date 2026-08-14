#!/bin/bash
USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: You must have sudo access"
    exit 1
fi
dnf list installed mysql
if [ $? -ne 0 ]
then
    dnf install mysql -y
    if [ $? -ne 0]
    then
        echo "Installing mysql ... FAILURE"
        exit 1
    else
        echo "Installing mysql ... SUCCESS"
    fi
else
    echo "Mysql is aalready ... Installed"
fi