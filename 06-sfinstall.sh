#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
E="\e[0m"

if [ $USERID -ne 0 ] 
then
    echo "$R ERROR: This script must be run as root. $E"
    exit 1
else
    echo "$G Running as root user. $E"
    
fi

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "$Y MySQL is not installed. Proceeding with installation. $E"
    dnf install mysql -y
    if [ $? -eq 0 ]
    then
        echo "$G MySQL installation completed successfully. $E"
    else
        echo "$R MySQL installation failed. $E"
        exit 1
    fi
    
else
    echo "$Y MySQL is already installed. Proceeding with configuration. $E"

fi


# dnf install mysql -y

# if [ $? -eq 0 ]
# then
#     echo "MySQL installation completed successfully."
# else
#     echo "MySQL installation failed."
#     exit 1
# fi