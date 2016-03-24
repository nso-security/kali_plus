#!/bin/bash

if test "$#" -ne 1; then
    echo "Must supply 1 argument - Middleman IP address"
fi

autossh -M 10984 -o "PubkeyAuthentication=yes" -o "PasswordAuthentication=no" -i /root/.ssh/nopwd -R 6666:localhost:22 kali_rvs@$1  

#to make this run on startup, add the following to /etc/rc.local and make sure Certificates are in configured

#/usr/bin/autossh -M 10984 -N -f -o "PubkeyAuthentication=yes" -o "PasswordAuthentication=no" -i /root/.ssh/nopwd -R 6666:localhost:22 kali_rvs@[CLOUD_IP] &

#/usr/bin/autossh -M 10986 -N -f -o "PubkeyAuthentication=yes" -o "PasswordAuthentication=no" -i /root/.ssh/nopwd -R 8888:localhost:5900 kali_rvs@[CLOUD_IP] &

#reference - https://raymii.org/s/tutorials/Autossh_persistent_tunnels.html

#also adding "AUTOSSH_POLL=120" to /etc/environment will cause autossh to check the connections every 2 minutes.
