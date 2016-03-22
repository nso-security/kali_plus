#!/bin/bash
if test "$#" -ne 1; then
    echo "Must supply 1 argument - Middleman IP address"
    exit
fi



#Reverse ssh Listener just in case
/usr/bin/autossh -M 10992 -f -N -o "PubkeyAuthentication=yes" -o "PasswordAuthentication=no" -i /root/.ssh/nopwd -R 9998:localhost:22 kali_rvs@$1 &


