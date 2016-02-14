#!/bin/sh -v
git clone https://github.com/CoreSecurity/impacket /opt/impacket
cd /opt/impacket
python setup.py install
