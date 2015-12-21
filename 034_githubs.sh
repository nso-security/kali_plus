#!/bin/bash -v

#CMSmap 
git clone https://github.com/wbmartin/CMSmap /opt/CMSmap   

#WPScan 
git clone https://github.com/wbmartin/wpscan.git /opt/wpscan 
cd /opt/wpscan && ./wpscan.rb --update
cd /opt

