#!/bin/bash -v 

#Massscan
apt-get install git gcc make libpcap-dev
git clone https://github.com/wbmartin/masscan.git /opt/masscan
cd /opt/masscan
make 
make install


