#!/bin/bash
apt-get install -y nmap traceroute libpcap-dev

#GPS libs for wireless mapping
apt-get install -y gpsd gpsd-clients

#Reverse Shells
apt-get install autossh ssh x11vnc
#apt-get install vinagre  ##2016-07-04 thought to be unneeded
#smbexec
apt-get install -y libxml2-dev
apt-get install -y libxlst-dev
# Sound Utilities
apt-get install -y libasound2 alsa-utils alsa-oss

#cve-search
apt-get install -y mongodb python3-pymongo python3-dateutil python3-redis

#search for header files
apt-get install -y apt-file

