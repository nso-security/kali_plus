#!/bin/bash -v
service postgresql start
update-rc.d postgresql enable
msfdb init
mkdir /root/.msf4
echo “spool /root/msf_console.log” > /root/.msf4/msfconsole.rc
echo "you'll need to manually exit metasploit after initializing it"
msfconsole

