#!/bin/bash -v

apt-get install linux-headers-$(uname -r) -y
echo "Virtual Box > Devices > Insert Guest Additions > and then press any key\n"
pause
mkdir /opt/vbox; cp /media/cdrom/VBoxLinuxAdditions.run /opt/vbox 
chmod 755 /opt/vbox/VBoxLinuxAdditions.run 
/opt/vbox/VBoxLinuxAdditions.run
echo "Note, for new virtual box installs, you should also install the extension pack\n\n"
echo "use this command: VBoxManage extpack install [DOWNLOADED EXTENSION PACK]"

echo "Ok, press any key to restart.  While restarting Virtual Box > Devices > Shared Clipboard"
shutdown -r now
