#!/bin/bash -v
#reference: https://hackerkitty.wordpress.com/2015/01/09/install-google-earth-on-kali-linux/
apt-get intstall -y lsb-core
firefox http://www.google.com/earth/download/ge/agree.html &
echo "download the deb to /root/Downloads then press any key to continue."
pause
dpkg -i /root/Downloads/google-earth-stable_current_amd64.deb
#you can run it with the "google-earth" command
