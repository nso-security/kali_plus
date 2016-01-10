#!/bin/bash -v



#HTTP Screenshot
pip install selenium 
git clone https://github.com/wbmartin/httpscreenshot.git /opt/httpscreenshot 
cd /opt/httpscreenshot
chmod +x install-dependencies.sh
./install-dependencies.sh
cd /opt

#Don't forget, to run this, use /opt/httpscreenshot/masshttp as a guide, replace the path to /opt/masscan and text file with inscope IP addresses.

