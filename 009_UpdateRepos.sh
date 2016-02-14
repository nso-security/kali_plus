#!/bin/bash -v
#Update the repositories
echo -e "\ndeb http://packages.linuxmint.com debian import\n" | tee -a /etc/apt/sources.list > /dev/null
echo -e "\ndeb http://http.kali.org/kali sana main non-free contrib " | tee -a /etc/apt/sources.list > /dev/null
echo -e "\ndeb-src http://http.kali.org/kali sana main non-free contrib " | tee -a /etc/apt/sources.list > /dev/null

apt-get update
apt-get upgrade -y
apt-get dist-upgrade -y
