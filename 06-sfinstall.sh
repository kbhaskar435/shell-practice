#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
E="\e[0m"

LOGS_FOLDER='/var/log/shellscript-logs'
SCRIPT_NAME=$(echo $0 | cut -d '.' -f 1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "Script started at $(date)" &>> $LOG_FILE

if [ $USERID -ne 0 ] 
then
    echo -e "$R ERROR: This script must be run as root. $E" | tee -a $LOG_FILE
    exit 1
else
    echo -e "$G Running as root user. $E" | tee -a $LOG_FILE
    
fi

dnf list installed mysql &>> $LOG_FILE
if [ $? -ne 0 ]
then
    echo -e "$Y MySQL is not installed. Proceeding with installation. $E" | tee -a $LOG_FILE
    dnf install mysql -y
    if [ $? -eq 0 ]
    then
        echo -e "$G MySQL installation completed successfully. $E" | tee -a $LOG_FILE
    else
        echo -e "$R MySQL installation failed. $E" | tee -a $LOG_FILE
        exit 1
    fi
    
else
    echo -e "$Y MySQL is already installed. Proceeding with configuration. $E" | tee -a $LOG_FILE

fi


# dnf install mysql -y

# if [ $? -eq 0 ]
# then
#     echo "MySQL installation completed successfully."
# else
#     echo "MySQL installation failed."
#     exit 1
# fi