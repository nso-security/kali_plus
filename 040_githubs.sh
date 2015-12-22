#!/bin/bash
#DSHashes 
wget http://ptscripts.googlecode.com/svn/trunk/dshashes.py -O /opt/NTDSXtract/dshashes.py   

#SPARTA: 
git clone https://github.com/secforce/sparta.git /opt/sparta 
apt-get install python-elixir 
apt-get install ldap-utils rwho rsh-client x11-apps finger
