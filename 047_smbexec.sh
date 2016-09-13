
#!/bin/bash -v
#dependencies
apt-get install -y libxslt-dev libxml2-dev

apt-get install -y automake autoconf autopoint gcc-mingw-w64-x86-64 libtool pkg-config

git clone https://github.com/brav0hax/smbexec.git /opt/smbexec
git clone https://github.com/libyal/libesedb.git /opt/libesedb

cd /opt/
wget http://www.ntdsxtract.com/downloads/ntdsxtract/ntdsxtract_v1_0.zip
unzip ntdsxtract_v1_0.zip
mv “NTDSXtract 1.0” NTDSXtract
rm ntdsxtract_v1_0.zip

#install libesedb
cd /opt/libesedb
./synclibs.sh
./autogen.sh
./configure
make


#SMBExec - 1. Select 1 - Debian/Ubuntu and derivatives 2) Select all defaults 
#Select 4 to compile smbexec binaries and then After compilation, select 5 to exit.  This will take a long time.

cd /opt/smbexec && ./install.sh 
./install.sh 

#SMBExec has trouble installing on the rolling Kali.  These two links will get it going
#1 Symlink the built in libs https://github.com/pentestgeek/smbexec/issues/125
#    from smbexec\progs:
#    ln -s /usr/bin/pth-winexe smbwinexe
#    ln -s /usr/bin/pth-smbclient smbexeclient

#2 Install NTDSXtract and mingw32
# http://hackers-workshop.net/how-to-install-smbexec2-on-kali-linux
# espectially check the smbexec.yml parameters
