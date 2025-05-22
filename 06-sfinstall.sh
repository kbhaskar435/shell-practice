#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ] 
then
    echo "ERROR: This script must be run as root."
    exit 1
else
    echo "Running as root user."
    
fi

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "MySQL is not installed. Proceeding with installation."
    dnf install mysql -y
    if [ $? -eq 0 ]
    then
        echo "MySQL installation completed successfully."
    else
        echo "MySQL installation failed."
        exit 1
    fi
    
else
    echo "MySQL is already installed."

fi


# dnf install mysql -y

# if [ $? -eq 0 ]
# then
#     echo "MySQL installation completed successfully."
# else
#     echo "MySQL installation failed."
#     exit 1
# fi