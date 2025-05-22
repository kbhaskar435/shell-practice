#!bin/bash

echo "All Variables passed to the script::$@"
echo "number of arguments passed to the script:: $#"
echo "Script name:: $0"
echo "PID of the script:: $$"
sleep 10 &
echo "PID of the last background process:: $!"
echo "Exit status of the last command:: $?"
echo "Home directory of the current user:: $HOME"
echo "Current shell:: $SHELL"
echo "Current working directory:: $PWD"
echo "Current user:: $USER"
echo "Terminal device name:: $TERM"
echo "Current date and time:: $(date)"
echo "Current shell name:: $BASH"
