#!/bin/bash -v
#WCE Windows Credential Editor (WCE) is used to pull passwords from memory 
#Note, you may have to adjust the version
cd /opt/
wget http://www.ampliasecurity.com/research/wce_v1_42beta_x64.zip
mkdir /opt/wce && unzip wce_v1* -d /opt/wce && rm wce_v1*.zip
