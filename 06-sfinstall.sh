#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
E="\e[0m"

LOGS_FOLDER='/var/log/shellscript-logs'
SCRIPT_NAME=$(echo $0 | cut -d '.' -f 1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
PACKAGES=("mysql","python3","nginx")

mkdir -p $LOGS_FOLDER
echo "Script started at $(date)" &>> $LOG_FILE

if [ $USERID -ne 0 ] 
then
    echo -e "$R ERROR: This script must be run as root. $E" | tee -a $LOG_FILE
    exit 1
else
    echo -e "$G Running as root user. $E" | tee -a $LOG_FILE
    
fi

VALIDATE(){
    if [ $1 eq 0 ]
    then
        echo -e "$G $2 installed successfully. $E" | tee -a $LOG_FILE
    else
        echo -e "$R $2 installation failed. $E" | tee -a $LOG_FILE
        exit 1
    fi
}

INSTALL(){
    echo -e "$Y Installing $1... $E" | tee -a $LOG_FILE
    dnf install $1 -y &>> $LOG_FILE
    VALIDATE $? $1
}

for i in ${PACKAGES[@]}
do
    dnf list installed $i &>> $LOG_FILE
    if [ $? -eq 0 ]
    then
        echo -e "$G $i is already installed. $E" | tee -a $LOG_FILE
    else
        echo -e "$Y $i is not installed. Proceeding with installation. $E" | tee -a $LOG_FILE
        INSTALL $i
    fi

done









# dnf install mysql -y

# if [ $? -eq 0 ]
# then
#     echo "MySQL installation completed successfully."
# else
#     echo "MySQL installation failed."
#     exit 1
# fi