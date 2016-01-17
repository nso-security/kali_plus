#!/bin/bash -v
#Update the repositories
echo -e "\ndeb http://packages.linuxmint.com debian import\n" | tee -a /etc/apt/sources.list > /dev/null
echo -e "\ndeb http://http.kali.org/kali sana main non-free contrib " | tee -a /etc/apt/sources.list > /dev/null
echo -e "\ndeb-src http://http.kali.org/kali sana main non-free contrib " | tee -a /etc/apt/sources.list > /dev/null

apt-get update
apt-get upgrade -y
apt-get dist-upgrade -y
apt-get install linux-headers-$(uname -r) -y
echo "Virtual Box > Devices > Insert Guest Additions > and then press any key\n"
pause
mkdir /opt/vbox; cp /media/cdrom/VBoxLinuxAdditions.run /opt/vbox 
chmod 755 /opt/vbox/VBoxLinuxAdditions.run 
/opt/vbox/VBoxLinuxAdditions.run
echo "Note, for new virtual box installs, you should also install the extension pack\n\n"

echo "Ok, press any key to restart.  While restarting Virtual Box > Devices > Shared Clipboard"
shutdown -r now
