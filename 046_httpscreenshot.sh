#!/bin/bash -v



#HTTP Screenshot
pip install selenium 
git clone https://github.com/wbmartin/httpscreenshot.git /opt/httpscreenshot 
cd /opt/httpscreenshot
chmod +x install-dependencies.sh
./install-dependencies.sh
cd /opt
