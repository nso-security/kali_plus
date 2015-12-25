
#!/bin/bash -v
#SMBExec - 1. Select 1 - Debian/Ubuntu and derivatives 2) Select all defaults 
#Select 4 to compile smbexec binaries and then After compilation, select 5 to exit.  This will take a long time.

git clone https://github.com/wbmartin/smbexec.git /opt/smbexec 
cd /opt/smbexec && ./install.sh 
./install.sh 
