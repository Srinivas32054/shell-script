#!/bin/bash
USERID=$(id -u)

VALIDATE(){
     if [ $1 -ne 0]
    then
        echo "$2 ... FAILURE"
        exit 1
    else
        echo "$2 ... SUCCESS"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "ERROR:: You must have sudo access"
    exit 1
fi
dnf list installed mysql
if [ $? -ne 0 ]
then
    dnf install mysql -y
    VALIDATE $? "Installing Mysql"
else
    echo "Mysql is aalready ... Installed"
fi