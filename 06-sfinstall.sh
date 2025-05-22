#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ] 
then
    echo "ERROR: This script must be run as root."
    exit 1
    
fi


dnf install mysqlgggg -y

if [ $? -ne 0 ]
then
    echo "ERROR: Failed to install MySQL."
    exit 1
else
    echo "MySQL installed successfully."
fi