
#!/bin/bash -v
#SMBExec - 1. Select 1 - Debian/Ubuntu and derivatives 2) Select all defaults 
#Select 4 to compile smbexec binaries and then After compilation, select 5 to exit.  This will take a long time.

git clone https://github.com/wbmartin/smbexec.git /opt/smbexec 
cd /opt/smbexec && ./install.sh 
./install.sh 

#SMBExec has trouble installing on the rolling Kali.  These two links will get it going
#1 Symlink the built in libs https://github.com/pentestgeek/smbexec/issues/125
#    from smbexec\progs:
#    ln -s /usr/bin/pth-winexe smbwinexe
#    ln -s /usr/bin/pth-smbclient smbexeclient

#2 Install NTDSXtract and mingw32
# http://hackers-workshop.net/howto-get-smbexec-work-with-kali-2-0/
