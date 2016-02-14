#!/bin/bash -v

#referenced http://www.drchaos.com/installing-firefox-on-kali-linux/
apt-get remove -y iceweasel
echo -e "\ndeb http://packages.linuxmint.com debian import" | tee -a /etc/apt/sources.list > /dev/null

gpg --keyserver pgp.mit.edu --recv-keys 3EE67F3D0FF405B2
gpg --export 3EE67F3D0FF405B2 > 3EE67F3D0FF405B2.gpg
apt-key add ./3EE67F3D0FF405B2.gpg
rm ./3EE67F3D0FF405B2.gpg
apt-get update
apt-get install -y firefox 


#When you get ready for web penetration testing you need to add these additions"
#Firefox Addons
#Web Developer Add-on: https://addons.mozilla.org/en-US/firefox/addon/web-developer/ 
#Tamper Data: https://addons.mozilla.org/en-US/firefox/addon/tamper-data/ 
#Foxy Proxy: https://addons.mozilla.org/en-US/firefox/addon/foxyproxy-standard/ 
#User Agent Switcher: https://addons.mozilla.org/en-US/firefox/addon/user-agent-switcher/
