#!/bin/bash -v
#Discover Scripts
git clone https://github.com/wbmartin/discover.git /opt/discover 
cd /opt/discover && ./setup.sh 
wget "https://goofile.googlecode.com/files/goofilev1.5.zip"
unzip -p goofilev1.5.zip goofilev1.5/goofile.py > /usr/bin/goofile && chmod +x /usr/bin/goofile



