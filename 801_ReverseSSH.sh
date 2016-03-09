#!/bin/bash

if test "$#" -ne 1; then
    echo "Must supply 1 argument - Middleman IP address"
fi

autossh -M 10984 -o "PubkeyAuthentication=yes" -o "PasswordAuthentication=no" -i /root/.ssh/nopwd -R 6666:localhost:22 remy@$1 -p 2222

#reference - https://raymii.org/s/tutorials/Autossh_persistent_tunnels.html
