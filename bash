#!/bin/zsh

os=/etc/os-release
errors=/var/log/logerror.log
updates=/var/log/logupdate.log


ECH() {

        if [ $? -ne 0 ]
        then
                echo "There is an error. Check $errors for information.\n"
        fi
}

echo "cmd to check updates in another shell ' tail -f /var/log/logupdate.log '\n "

if grep -q "debian" $os
then
        sudo apt update 1>> $updates 2>> $errors
        ECH

        sudo apt dist-upgrade -y 1>> $updates 2>> $errors
        ECH 
fi



echo " $(date) system  updated."
