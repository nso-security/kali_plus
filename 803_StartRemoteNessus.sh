#!/bin/bash
if test "$#" -ne 1; then
    echo "Must supply 1 argument - Middleman IP address"
    exit
fi


#Start nessus 
service nessusd start

#Reverse VNC Listener
/usr/bin/autossh -M 10990 -f -N -o "PubkeyAuthentication=yes" -o "PasswordAuthentication=no" -i /root/.ssh/nopwd -R 9999:localhost:8834 kali_rvs@$1 &


