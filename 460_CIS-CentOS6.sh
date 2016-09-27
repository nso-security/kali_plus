#!/bin/bash
echo "***CIS RHEL 6.0 – CIS Benchmark***"
#run as ./460_CIS-CentOS6.sh >/tmp/`hostname`-audit-`(date +%m%d%Y)`.txt 2>&1

echo "======================================================================================"
echo "***CIS Ref: 1 Initial Setup***"


echo "***CIS Ref: 1.1 Filesystem Configuration***"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 1.1.1.1 Ensure mounting of cramfs filesystems is disabled (Scored)***"
echo "   Command: modprobe -n -v cramfs "
modprobe -n -v cramfs 
echo "******Expect:  install /bin/true"
echo "   Command: lsmod | grep cramfs"
lsmod | grep cramfs
echo "******Expect:  <No output>"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 1.1.1.2 Ensure mounting of freevxfs filesystems is disabled (Scored)***"
echo "   Command: modprobe -n -v freevxfs"
modprobe -n -v freevxfs
echo "******Expect:  install /bin/true"
echo "   Command: lsmod | grep freevxfs"
lsmod | grep freevxfs
echo "******Expect:  <No output>"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 1.1.1.3 Ensure mounting of jffs2 filesystems is disabled (Scored)***"
echo "   Command: modprobe -n -v jffs2"
modprobe -n -v jffs2
echo "******Expect:  install /bin/true"
echo "   Command: lsmod | grep jffs2"
lsmod | grep jffs2
echo "******Expect:  <No output>"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 1.1.1.4 Ensure mounting of hfs filesystems is disabled (Scored)***"
echo "   Command: modprobe -n -v hfs "
modprobe -n -v hfs 
echo "******Expect:  install /bin/true"
echo "   Command: lsmod | grep hfs"
lsmod | grep hfs
echo "******Expect:  <No output>"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 1.1.1.5 Ensure mounting of hfsplus filesystems is disabled (Scored)***"
echo "   Command: modprobe -n -v hfsplus "
modprobe -n -v hfsplus 
echo "******Expect:  install /bin/true"
echo "   Command: lsmod | grep hfsplus"
lsmod | grep hfsplus
echo "******Expect:  <No output>"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 1.1.1.6 Ensure mounting of squashfs filesystems is disabled (Scored)***"
echo "   Command: modprobe -n -v squashfs "
modprobe -n -v squashfs 
echo "******Expect:  "
echo "   Command: lsmod | grep squashfs"
lsmod | grep squashfs
echo "******Expect:  "
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 1.1.1.7 Ensure mounting of udf filesystems is disabled (Scored)***"
echo "   Command: modprobe -n -v udf "
modprobe -n -v udf 
echo "******Expect:  install /bin/true"
echo "   Command: lsmod | grep udf"
lsmod | grep udf
echo "******Expect:  <No output>"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 1.1.1.8 Ensure mounting of FAT filesystems is disabled (Scored)***"
echo "   Command: modprobe -n -v vfat "
modprobe -n -v vfat 
echo "******Expect:  install /bin/true"
echo "   Command: lsmod | grep vfat"
lsmod | grep vfat
echo "******Expect:  <No output>"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 1.1.2 Ensure separate partition exists for /tmp (L2 Scored)***"
echo "   Command: mount | grep /tmp"
mount | grep /tmp
echo "******Expect:  /tmp is mounted"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 1.1.3 Ensure nodev option set on /tmp partition (Scored)***"
echo "   Command: mount | grep /tmp | grep nodev"
mount | grep /tmp | grep nodev
echo "******Expect:  nodev is defined"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 1.1.4 Ensure nosuid option set on /tmp partition (Scored)***"
echo "   Command: mount | grep /tmp | grep nosuid"
mount | grep /tmp | grep nosuid
echo "******Expect:  nosuid is defined"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 1.1.5 Ensure noexec option set on /tmp partition (Scored)***"
echo "   Command: mount | grep /tmp | grep noexec"
mount | grep /tmp | grep noexec
echo "******Expect:  noexec is defined"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 1.1.6 Ensure separate partition exists for /var (L2 Scored)***"
echo "   Command: mount | grep /var"
mount | grep /var
echo "******Expect:  /var is mounted"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 1.1.7 Ensure separate partition exists for /var/tmp (L2 Scored)***"
echo "   Command: mount | grep /var/tmp "
mount | grep /var/tmp 
echo "******Expect:  /var/tmp is mounted"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 1.1.8 Ensure nodev option set on /var/tmp partition (Scored)***"
echo "   Command: mount | grep /var/tmp | grep nodev"
mount | grep /var/tmp | grep nodev
echo "******Expect:  nodev is defined"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 1.1.9 Ensure nosuid option set on /var/tmp partition (Scored)***"
echo "   Command: mount | grep /var/tmp"
mount | grep /var/tmp |grep nosuid
echo "******Expect:  nosuid is defined"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 1.1.10 Ensure noexec option set on /var/tmp partition (Scored)***"
echo "   Command: mount | grep /var/tmp | grep noexec"
mount | grep /var/tmp | grep noexec
echo "******Expect: noexec is defined "
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 1.1.11 Ensure separate partition exists for /var/log (L2 Scored)***"
echo "   Command: mount | grep /var/log"
mount | grep /var/log
echo "******Expect:  /var/log is defined"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 1.1.12 Ensure separate partition exists for /var/log/audit (L2 Scored)***"
echo "   Command: mount | grep /var/log/audit"
mount | grep /var/log/audit
echo "******Expect:  /var/log/audit is defined"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 1.1.13 Ensure separate partition exists for /home (L2 Scored)***"
echo "   Command: mount | grep /home"
mount | grep /home
echo "******Expect:  /home is defined"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 1.1.14 Ensure nodev option set on /home partition (Scored)***"
echo "   Command: mount | grep /home | grep nodev"
mount | grep /home | grep nodev
echo "******Expect:  nodev is defined"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 1.1.15 Ensure nodev option set on /dev/shm partition (Scored)***"
echo "   Command: mount | grep /dev/shm | grep nodev"
mount | grep /dev/shm | grep nodev
echo "******Expect:  nodev is defined"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 1.1.16 Ensure nosuid option set on /dev/shm partition (Scored)***"
echo "   Command: mount | grep /dev/shm | grep nosuid"
mount | grep /dev/shm | grep nosuid
echo "******Expect:  nosuid is defined"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 1.1.17 Ensure noexec option set on /dev/shm partition (Scored)***"
echo "   Command: mount | grep /dev/shm | grep noexec"
mount | grep /dev/shm | grep noexec
echo "******Expect:  noexec is defined"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 1.1.18 Ensure nodev option set on removable media partitions (Not Scored)***"
echo "   Command: mount"
mount
echo "******Expect:  manual review - look for any removable media"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 1.1.19 Ensure nosuid option set on removable media partitions (Not Scored)***"
echo "   Command: mount"
mount
echo "******Expect:  nosuid is defined for removable media"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 1.1.20 Ensure noexec option set on removable media partitions (Not Scored)***"
echo "   Command: mount"
mount
echo "******Expect:  noexec is defined for removable media"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 1.1.21 Ensure sticky bit is set on all world-writable directories (Scored)***"
echo "   Command: df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -type d \( -perm -0002 -a ! -perm -1000 \) 2>/dev/null"
df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -type d \( -perm -0002 -a ! -perm -1000 \) 2>/dev/null
echo "******Expect:  no results"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 1.1.22 Disable Automounting (Scored)***"
echo "   Command: systemctl is-enabled autofs"
systemctl is-enabled autofs
echo "******Expect:  all runlevels are listed as "off" or autofs is not available"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 1.2 Configure Software Updates***"


echo "***CIS Ref: 1.2.1 Ensure package manager repositories are configured (Not Scored)***"
echo "   Command: yum repolist"
yum repolist
echo "******Expect:  no errors"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 1.2.2 Ensure GPG keys are configured (Not Scored)***"
echo "   Command: rpm -q gpg-pubkey --qf '%{name}-%{version}-%{release} --> %{summary}\n'"
rpm -q gpg-pubkey --qf '%{name}-%{version}-%{release} --> %{summary}\n'
echo "******Expect:  noerrors"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 1.2.3 Ensure gpgcheck is globally activated (Scored)***"
echo "   Command: grep ^gpgcheck /etc/yum.conf"
grep ^gpgcheck /etc/yum.conf
echo "******Expect:  gpgcheck=1"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 1.3 Filesystem Integrity Checking***"


echo "***CIS Ref: 1.3.1 Ensure AIDE is installed (Scored)***"
echo "   Command: rpm -q aide"
rpm -q aide
echo "******Expect: aide-<version> "
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 1.3.2 Ensure filesystem integrity is regularly checked (Scored)***"
echo "   Command: crontab -u root -l | grep aide"
crontab -u root -l | grep aide
echo "******Expect:  cron job scheduled to run the aide check."
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 1.4 Secure Boot Settings***"

echo "***CIS Ref: 1.4.1 Ensure permissions on bootloader config are configured (Scored)***"
echo "   Command: stat /boot/grub2/grub.conf"
stat /boot/grub/grub.conf
echo "******Expect: Uid and Gid are both 0/root and Access does not grant permissions to group or other "
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 1.4.2 Ensure bootloader password is set (Scored)***"
echo "   Command: grep "^password" /boot/grub2/grub.cconf"
grep "^password" /boot/grub/grub.conf
echo "******Expect:  password --md5 <encrypted-password>"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 1.4.3 Ensure authentication required for single user mode (Scored)***"
echo "   Command: grep ^SINGLE /etc/sysconfig/init"
grep ^SINGLE /etc/sysconfig/init
echo "******Expect:  SINGLE=/sbin/sulogin"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 1.4.4 Ensure interactive boot is not enabled (Scored)***"
echo "   Command: grep "^PROMPT=" /etc/sysconfig/init"
grep "^PROMPT=" /etc/sysconfig/init
echo "******Expect:  PROMPT=no"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 1.5 Additional Process Hardening***"

echo "***CIS Ref: 1.5.1 Ensure core dumps are restricted (Scored)***"
echo "   Command: grep "hard core" /etc/security/limits.conf /etc/security/limits.d/*"
grep "hard core" /etc/security/limits.conf /etc/security/limits.d/*
echo "******Expect: * hard core 0 "
echo "   Command: sysctl fs.suid_dumpable"
sysctl fs.suid_dumpable
echo "******Expect:  fs.suid_dumpable = 0"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 1.5.2 Ensure XD/NX support is enabled (Not Scored)***"
echo "   Command: dmesg | grep NX"
dmesg | grep NX
echo "******Expect:  NX (Execute Disable) protection: active"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 1.5.3 Ensure address space layout randomization (ASLR) is enabled (Scored)***"
echo "   Command: sysctl kernel.randomize_va_space"
sysctl kernel.randomize_va_space
echo "******Expect:  kernel.randomize_va_space = 2"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 1.5.4 Ensure prelink is disabled (Scored)***"
echo "   Command: rpm -q prelink"
rpm -q prelink
echo "******Expect:  package prelink is not installed"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 1.6 Mandatory Access Control***"

echo "***CIS Ref: 1.6.1.1 Ensure SELinux is not disabled in bootloader configuration (L2 Scored)***"
echo "   Command: grep "^\s*linux" /boot/grub/grub.conf"
grep "^\s*linux" /boot/grub/grub.conf
echo "******Expect:  no kernel line has the selinux=0 or enforcing=0 parameters set"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 1.6.1.2 Ensure the SELinux state is enforcing (L2 Scored)***"
echo "   Command: grep SELINUX=enforcing /etc/selinux/config "
grep SELINUX=enforcing /etc/selinux/config 
echo "******Expect:  SELINUX=enforcing"
echo "   Command: sestatus"
sestatus
echo "******Expect:  SELinux status: enabled Current mode: enforcing Mode from config file: enforcing"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 1.6.1.3 Ensure SELinux policy is configured (L2 Scored)***"
echo "   Command: grep SELINUXTYPE=targeted /etc/selinux/config"
grep SELINUXTYPE=targeted /etc/selinux/config
echo "******Expect:  Policy from config file: targeted"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 1.6.1.4 Ensure SETroubleshoot is not installed (L2 Scored)***"
echo "   Command: rpm -q setroubleshoot"
rpm -q setroubleshoot
echo "******Expect:  package setroubleshoot is not installed"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 1.6.1.5 Ensure the MCS Translation Service (mcstrans) is not installed (L2 Scored)***"
echo "   Command: rpm -q mcstrans"
rpm -q mcstrans
echo "******Expect:  package mcstrans is not installed"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 1.6.1.6 Ensure no unconfined daemons exist (L2 Scored)***"
echo "   Command: [ESCAPED]"
ps -eZ | egrep "initrc" | egrep -vw "tr|ps|egrep|bash|awk" | tr ':' ' ' | awk '{ print $NF }'
echo "******Expect:  not output is produced"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 1.6.2 Ensure SELinux is installed (L2 Scored)***"
echo "   Command: rpm -q libselinux"
rpm -q libselinux
echo "******Expect: libselinux-<version>"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 1.7 Warning Banners***"

echo "***CIS Ref: 1.7.1.1 Ensure message of the day is configured properly (Scored)***"
echo "   Command: cat /etc/motd"
cat /etc/motd
echo "******Expect:  reasonable banner"
echo "   Command: egrep '(\\v|\\r|\\m|\\s)' /etc/motd"
egrep '(\\v|\\r|\\m|\\s)' /etc/motd
echo "******Expect:  noresults"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 1.7.1.2 Ensure local login warning banner is configured properly (Not Scored)***"
echo "   Command: cat /etc/issue"
cat /etc/issue
echo "******Expect:  "
echo "   Command: egrep '(\\v|\\r|\\m|\\s)' /etc/issue"
egrep '(\\v|\\r|\\m|\\s)' /etc/issue
echo "******Expect:  no results"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 1.7.1.3 Ensure remote login warning banner is configured properly (Not Scored)***"
echo "   Command: cat /etc/issue.net"
cat /etc/issue.net
echo "******Expect:  reasonable banner"
echo "   Command: egrep '(\\v|\\r|\\m|\\s)' /etc/issue.net"
egrep '(\\v|\\r|\\m|\\s)' /etc/issue.net
echo "******Expect:  no results"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 1.7.1.4 Ensure permissions on /etc/motd are configured (Not Scored)***"
echo "   Command: stat /etc/motd"
stat /etc/motd
echo "******Expect:  Uid and Gid are both 0/root and Access is 644:  Access: (0644/-rw-r--r--)"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 1.7.1.5 Ensure permissions on /etc/issue are configured (Scored)***"
echo "   Command: stat /etc/issue"
stat /etc/issue
echo "******Expect: Uid and Gid are both 0/root and Access is 644: "
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 1.7.1.6 Ensure permissions on /etc/issue.net are configured (Not Scored)***"
echo "   Command: stat /etc/issue.net"
stat /etc/issue.net
echo "******Expect:  Uid and Gid are both 0/root and Access is 644"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 1.7.2 Ensure GDM login banner is configured (Scored)***"
echo "   Command: [SCRIPT]"
grep user-db /etc/dconf/profile/gdm
echo "******Expect: exists"
grep system-db /etc/dconf/profile/gdm
echo "******Expect: exists"
grep file-db /etc/dconf/profile/gdm
echo "******Expect: exists"
grep banner-message-enable /etc/dconf/db/gdm.d/01-banner-message
echo "******Expect: banner-message-enable=true"
grep banner-message-text  /etc/dconf/db/gdm.d/01-banner-message
echo "******Expect: banner-message-text='<banner message>'"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 1.8 Ensure updates, patches, and additional security software are installed (Not Scored)***"
echo "   Command: yum check-update"
yum check-update
echo "******Expect:  no updates or patches to install"
echo "--------------------------------------------------------------------------------------"



echo "======================================================================================"
echo "***CIS Ref: 2 Services***"

echo "***CIS Ref: 2.1 inetd Services***"


echo "***CIS Ref: 2.1.1 Ensure chargen services are not enabled (Scored)***"
echo "   Command: chkconfig --list | grep chargen"
chkconfig --list | grep chargen
echo "******Expect:  chargen-dgram and chargen-stream are off or missing"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 2.1.2 Ensure daytime services are not enabled (Scored)***"
echo "   Command: chkconfig --list | grep daytime"
chkconfig --list | grep daytime
echo "******Expect:  daytime-dgram and daytime-stream are off or missing"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 2.1.3 Ensure discard services are not enabled (Scored)***"
echo "   Command: chkconfig --list | grep discard"
chkconfig --list | grep discard
echo "******Expect:  discard-dgram and discard-stream are off or missing"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 2.1.4 Ensure echo services are not enabled (Scored)***"
echo "   Command: chkconfig --list | grep echo"
chkconfig --list | grep echo
echo "******Expect:  echo-dgram and echo-stream are off or missing:"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 2.1.5 Ensure time services are not enabled (Scored)***"
echo "   Command: chkconfig --list | grep time"
chkconfig --list | grep time
echo "******Expect:  time-dgram and time-stream are off or missing:"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 2.1.6 Ensure rsh server is not enabled (Scored)***"
echo "   Command: chkconfig --list | grep rexec"
chkconfig --list | grep rexec
echo "******Expect:  no result"
echo "   Command: chkconfig --list | grep rlogin"
chkconfig --list | grep rlogin
echo "******Expect:  no result"
echo "   Command: chkconfig --list | grep rsh"
chkconfig --list | grep rsh
echo "******Expect:  no result"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 2.1.7 Ensure talk server is not enabled (Scored)***"
echo "   Command: chkconfig --list |grep talk"
chkconfig --list |grep talk
echo "******Expect: no result "
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 2.1.8 Ensure telnet server is not enabled (Scored)***"
echo "   Command: chkconfig --list |grep telnet"
chkconfig --list |grep telnet
echo "******Expect:  no result"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 2.1.9 Ensure tftp server is not enabled (Scored)***"
echo "   Command: chkconfig --list | grep tftp"
chkconfig --list | grep tftp
echo "******Expect:  off or missing"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 2.1.10 Ensure rsync service is not enabled (Scored)***"
echo "   Command: chkconfig --list | grep rsync"
chkconfig --list | grep rsync
echo "******Expect:  off or missing"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 2.1.11 Ensure xinetd is not enabled (Scored)***"
echo "   Command: systemctl is-enabled xinetd"
systemctl is-enabled xinetd
echo "******Expect:  off or missing"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 2.2 Special Purpose Services***"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 2.2.1.1 Ensure time synchronization is in use (Not Scored)***"
echo "   Command: rpm -q ntp"
rpm -q ntp
echo "******Expect:  exists"
echo "   Command: rpm -q chrony"
rpm -q chrony
echo "******Expect:  exists"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 2.2.1.2 Ensure ntp is configured (Scored)***"
echo "   Command: grep "^restrict" /etc/ntp.conf"
grep "^restrict" /etc/ntp.conf
echo "******Expect:  -4 and -6 row"
echo "   Command: grep "^server" /etc/ntp.conf"
grep "^server" /etc/ntp.conf
echo "******Expect:  exists"
echo "   Command: grep "^OPTIONS" /etc/sysconfig/ntpd"
grep "^OPTIONS" /etc/sysconfig/ntpd
echo "******Expect:  exists"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 2.2.1.3 Ensure chrony is configured (Scored)***"
echo "   Command: grep "^server" /etc/chrony.conf"
grep "^server" /etc/chrony.conf
echo "******Expect:  server <remote-server>"
echo "   Command: grep ^OPTIONS /etc/sysconfig/chronyd"
grep ^OPTIONS /etc/sysconfig/chronyd
echo "******Expect:  OPTIONS="-u chrony""
echo "   Command: rpm -qa xorg-x11*"
rpm -qa xorg-x11*
echo "******Expect:  "
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 2.2.2 Ensure X Window System is not installed (Scored)***"
echo "   Command: rpm -qa xorg-x11*"
rpm -qa xorg-x11*
echo "******Expect:  no output"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 2.2.3 Ensure Avahi Server is not enabled (Scored)***"
echo "   Command: chkconfig --list avahi-daemon"
chkconfig --list avahi-daemon
echo "******Expect:  no output/ all levels off"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 2.2.4 Ensure CUPS is not enabled (Scored)***"
echo "   Command: chkconfig --list cups"
chkconfig --list cups
echo "******Expect:  no output/ all levels off"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 2.2.5 Ensure DHCP Server is not enabled (Scored)***"
echo "   Command: chkconfig --list dhcpd"
chkconfig --list dhcpd
echo "******Expect:  no output/ all levels off"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 2.2.6 Ensure LDAP server is not enabled (Scored)***"
echo "   Command: chkconfig --list slapd"
chkconfig --list slapd
echo "******Expect:  no output/ all levels off"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 2.2.7 Ensure NFS and RPC are not enabled (Scored)***"
echo "   Command: chkconfig --list nfs"
chkconfig --list nfs
echo "******Expect:  no output/ all levels off"
echo "   Command: chkconfig --list rpcbind"
chkconfig --list rpcbind
echo "******Expect:  no output/ all levels off"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 2.2.8 Ensure DNS Server is not enabled (Scored)***"
echo "   Command: chkconfig --list named"
chkconfig --list named
echo "******Expect:  no output/ all levels off"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 2.2.9 Ensure FTP Server is not enabled (Scored)***"
echo "   Command: chkconfig --list vsftpd"
chkconfig --list vsftpd
echo "******Expect:  no output/ all levels off"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 2.2.10 Ensure HTTP server is not enabled (Scored)***"
echo "   Command: chkconfig --list httpd"
chkconfig --list httpd
echo "******Expect:  no output/ all levels off"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 2.2.11 Ensure IMAP and POP3 server is not enabled (Scored)***"
echo "   Command: chkconfig --list dovecot"
chkconfig --list dovecot
echo "******Expect:  no output/ all levels off"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 2.2.12 Ensure Samba is not enabled (Scored)***"
echo "   Command: chkconfig --list smb"
chkconfig --list smb
echo "******Expect:  "
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 2.2.13 Ensure HTTP Proxy Server is not enabled (Scored)***"
echo "   Command: chkconfig --list squid"
chkconfig --list squid
echo "******Expect:  no output/ all levels off"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 2.2.14 Ensure SNMP Server is not enabled (Scored)***"
echo "   Command: chkconfig --list snmpd"
chkconfig --list snmpd
echo "******Expect:  no output/ all levels off"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 2.2.15 Ensure mail transfer agent is configured for local-only mode (Scored***"
echo "   Command: netstat -an | grep LIST | grep ":25[[:space:]]""
netstat -an | grep LIST | grep ":25[[:space:]]"
echo "******Expect:  MTA is not listening on any non-loopback address (127.0.0.1 or ::1):"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 2.2.16 Ensure NIS Server is not enabled (Scored)***"
echo "   Command: chkconfig --list ypserv"
chkconfig --list ypserv
echo "******Expect: no output/ all levels off "
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 2.3 Service Clients***"

echo "***CIS Ref: 2.3.1 Ensure NIS Client is not installed (Scored)***"
echo "   Command: rpm -q ypbind"
rpm -q ypbind
echo "******Expect:  not insstalled"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 2.3.2 Ensure rsh client is not installed (Scored)***"
echo "   Command: rpm -q rsh"
rpm -q rsh
echo "******Expect:  not insstalled"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 2.3.3 Ensure talk client is not installed (Scored)***"
echo "   Command: rpm -q talk"
rpm -q talk
echo "******Expect:  not insstalled"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 2.3.4 Ensure telnet client is not installed (Scored)***"
echo "   Command: rpm -q telnet"
rpm -q telnet
echo "******Expect:  not insstalled"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 2.3.5 Ensure LDAP client is not installed (Scored)***"
echo "   Command: rpm -q openldap-clients"
rpm -q openldap-clients
echo "******Expect:  not insstalled"
echo "--------------------------------------------------------------------------------------"


echo "======================================================================================"
echo "***CIS Ref: 3 Network Configuration***"


echo "***CIS Ref: 3.1 Network Parameters (Host Only)***"



echo "***CIS Ref: 3.1.1 Ensure IP forwarding is disabled (Scored)***"
echo "   Command: sysctl net.ipv4.ip_forward"
sysctl net.ipv4.ip_forward
echo "******Expect:  net.ipv4.ip_forward = 0"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 3.1.2 Ensure packet redirect sending is disabled (Scored)***"
echo "   Command: sysctl net.ipv4.conf.all.send_redirects "
sysctl net.ipv4.conf.all.send_redirects 
echo "******Expect: net.ipv4.conf.all.send_redirects = 0 "
echo "   Command: sysctl net.ipv4.conf.default.send_redirects"
sysctl net.ipv4.conf.default.send_redirects
echo "******Expect:  net.ipv4.conf.default.send_redirects = 0"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 3.2 Network Parameters (Host and Router)***"

echo "***CIS Ref: 3.2.1 Ensure source routed packets are not accepted (Scored)***"
echo "   Command: sysctl net.ipv4.conf.all.accept_source_route"
sysctl net.ipv4.conf.all.accept_source_route
echo "******Expect:  net.ipv4.conf.all.accept_source_route = 0"
echo "   Command: sysctl net.ipv4.conf.default.accept_source_route"
sysctl net.ipv4.conf.default.accept_source_route
echo "******Expect:  net.ipv4.conf.default.accept_source_route = 0"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 3.2.2 Ensure ICMP redirects are not accepted (Scored)***"
echo "   Command: sysctl net.ipv4.conf.all.accept_redirects"
sysctl net.ipv4.conf.all.accept_redirects
echo "******Expect:  net.ipv4.conf.all.accept_redirects = 0"
echo "   Command: sysctl net.ipv4.conf.default.accept_redirects"
sysctl net.ipv4.conf.default.accept_redirects
echo "******Expect:   net.ipv4.conf.default.accept_redirects = 0"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 3.2.3 Ensure secure ICMP redirects are not accepted (Scored)***"
echo "   Command: sysctl net.ipv4.conf.all.secure_redirects "
sysctl net.ipv4.conf.all.secure_redirects 
echo "******Expect:  net.ipv4.conf.all.accept_redirects = 0"
echo "   Command: sysctl net.ipv4.conf.default.secure_redirects"
sysctl net.ipv4.conf.default.secure_redirects
echo "******Expect:  net.ipv4.conf.default.accept_redirects = 0"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 3.2.4 Ensure suspicious packets are logged (Scored)***"
echo "   Command: sysctl net.ipv4.conf.all.log_martians "
sysctl net.ipv4.conf.all.log_martians 
echo "******Expect:  net.ipv4.conf.all.log_martians = 1"
echo "   Command: sysctl net.ipv4.conf.default.log_martians"
sysctl net.ipv4.conf.default.log_martians
echo "******Expect:  net.ipv4.conf.default.log_martians = 1"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 3.2.5 Ensure broadcast ICMP requests are ignored (Scored)***"
echo "   Command: sysctl net.ipv4.icmp_echo_ignore_broadcasts"
sysctl net.ipv4.icmp_echo_ignore_broadcasts
echo "******Expect:  net.ipv4.icmp_echo_ignore_broadcasts = 1"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 3.2.6 Ensure bogus ICMP responses are ignored (Scored)***"
echo "   Command: sysctl net.ipv4.icmp_ignore_bogus_error_responses"
sysctl net.ipv4.icmp_ignore_bogus_error_responses
echo "******Expect:  net.ipv4.icmp_ignore_bogus_error_responses = 1"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 3.2.7 Ensure Reverse Path Filtering is enabled (Scored)***"
echo "   Command: sysctl net.ipv4.conf.all.rp_filter "
sysctl net.ipv4.conf.all.rp_filter 
echo "******Expect:  net.ipv4.conf.all.rp_filter = 1"
echo "   Command: sysctl net.ipv4.conf.default.rp_filter"
sysctl net.ipv4.conf.default.rp_filter
echo "******Expect:  net.ipv4.conf.default.rp_filter = 1"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 3.2.8 Ensure TCP SYN Cookies is enabled (Scored)***"
echo "   Command: sysctl net.ipv4.tcp_syncookies"
sysctl net.ipv4.tcp_syncookies
echo "******Expect:  net.ipv4.tcp_syncookies = 1"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 3.3 IPv6***"

echo "***CIS Ref: 3.3.1 Ensure IPv6 router advertisements are not accepted (Scored)***"
echo "   Command: sysctl net.ipv6.conf.all.accept_ra "
sysctl net.ipv6.conf.all.accept_ra 
echo "******Expect: net.ipv6.conf.all.accept_ra = 0 "
echo "   Command: sysctl net.ipv6.conf.default.accept_ra"
sysctl net.ipv6.conf.default.accept_ra
echo "******Expect:  net.ipv6.conf.default.accept_ra = 0"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 3.3.2 Ensure IPv6 redirects are not accepted (Scored)***"
echo "   Command: sysctl net.ipv6.conf.all.accept_redirects "
sysctl net.ipv6.conf.all.accept_redirects 
echo "******Expect:  net.ipv6.conf.all.accept_redirect = 0"
echo "   Command: sysctl net.ipv6.conf.default.accept_redirects"
sysctl net.ipv6.conf.default.accept_redirects
echo "******Expect:  net.ipv6.conf.default.accept_redirect = 0"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 3.3.3 Ensure IPv6 is disabled (Not Scored)***"
echo "   Command: modprobe -c | grep ipv6"
modprobe -c | grep ipv6
echo "******Expect:  options ipv6 disable=1"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 3.4 TCP Wrappers***"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 3.4.1 Ensure TCP Wrappers is installed (Scored)***"
echo "   Command: rpm -q tcp_wrappers"
rpm -q tcp_wrappers
echo "******Expect:  tcp_wrappers-<version>"
echo "   Command: rpm -q tcp_wrappers-libs"
rpm -q tcp_wrappers-libs
echo "******Expect:  tcp_wrappers-libs-<version>"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 3.4.2 Ensure /etc/hosts.allow is configured (Scored)***"
echo "   Command: cat /etc/hosts.allow"
cat /etc/hosts.allow
echo "******Expect:  manual review, at least exists."
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 3.4.3 Ensure /etc/hosts.deny is configured (Scored)***"
echo "   Command: cat /etc/hosts.deny"
cat /etc/hosts.deny
echo "******Expect: All:All "
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 3.4.4 Ensure permissions on /etc/hosts.allow are configured (Scored)***"
echo "   Command: stat /etc/hosts.allow"
stat /etc/hosts.allow
echo "******Expect:  ALL: ALL"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 3.4.5 Ensure permissions on /etc/hosts.deny are configured (Scored)***"
echo "   Command: stat /etc/hosts.deny"
stat /etc/hosts.deny
echo "******Expect:  Uid and Gid are both 0/root and Access is 644"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 3.5 Uncommon Network Protocols***"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 3.5.1 Ensure DCCP is disabled (Not Scored)***"
echo "   Command: modprobe -n -v dccp "
modprobe -n -v dccp 
echo "******Expect:  install /bin/true"
echo "   Command: lsmod | grep dccp"
lsmod | grep dccp
echo "******Expect: <No output> "
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 3.5.2 Ensure SCTP is disabled (Not Scored)***"
echo "   Command: modprobe -n -v sctp "
modprobe -n -v sctp 
echo "******Expect:  install /bin/true"
echo "   Command: lsmod | grep sctp"
lsmod | grep sctp
echo "******Expect:  <No output>"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 3.5.3 Ensure RDS is disabled (Not Scored)***"
echo "   Command: modprobe -n -v rds "
modprobe -n -v rds 
echo "******Expect:  install /bin/true"
echo "   Command: lsmod | grep rds"
lsmod | grep rds
echo "******Expect:  <No output>"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 3.5.4 Ensure TIPC is disabled (Not Scored)***"
echo "   Command: modprobe -n -v tipc "
modprobe -n -v tipc 
echo "******Expect:  install /bin/true"
echo "   Command: lsmod | grep tipc"
lsmod | grep tipc
echo "******Expect:  <No output>"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 3.6 Firewall Configuration***"

echo "***CIS Ref: 3.6.1 Ensure iptables is installed (Scored)***"
echo "   Command: rpm -q iptables"
rpm -q iptables
echo "******Expect:  iptables-<version>"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 3.6.2 Ensure default deny firewall policy (Scored)***"
echo "   Command: iptables -L"
iptables -L
echo "******Expect:  policy for the INPUT, OUTPUT, and FORWARD chains is DROP or REJECT"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 3.6.3 Ensure loopback traffic is configured (Scored)***"
echo "   Command: iptables -L INPUT -v -n"
iptables -L INPUT -v -n
echo "******Expect:  see benchmark"
echo "   Command: iptables -L OUTPUT -v -n"
iptables -L OUTPUT -v -n
echo "******Expect:  see benchmark, fail if no rules"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 3.6.4 Ensure outbound and established connections are configured (Not Scored) 154***"
echo "   Command: iptables -L -v -n"
iptables -L -v -n
echo "******Expect:  see benchmark, fail if no rules"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 3.6.5 Ensure firewall rules exist for all open ports (Scored)***"
echo "   Command: netstat -ln"
netstat -ln
echo "******Expect:  Compare these rules"
echo "   Command: iptables -L INPUT -v -n"
iptables -L INPUT -v -n
echo "******Expect:  Compare these rules"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 3.7 Ensure wireless interfaces are disabled (Not Scored)***"
echo "   Command: iwconfig"
iwconfig
echo "******Expect:  use results in next check"
echo "   Command: ip link show up"
ip link show up
echo "******Expect:  none"
echo "--------------------------------------------------------------------------------------"



echo "======================================================================================"
echo "***CIS Ref: 4 Logging and Auditing***"

echo "***CIS Ref: 4.1 Configure System Accounting (auditd)***"

echo "***CIS Ref: 4.1.1.1 Ensure audit log storage size is configured (L2 Not Scored)***"
echo "   Command: grep max_log_file /etc/audit/auditd.conf"
grep max_log_file /etc/audit/auditd.conf
echo "******Expect:  Max_log_file = <MB>"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 4.1.1.2 Ensure system is disabled when audit logs are full (L2 Scored)***"
echo "   Command: grep space_left_action /etc/audit/auditd.conf "
grep space_left_action /etc/audit/auditd.conf 
echo "******Expect:  space_left_action = email"
echo "   Command: grep action_mail_acct /etc/audit/auditd.conf "
grep action_mail_acct /etc/audit/auditd.conf 
echo "******Expect:  action_mail_acct = root"
echo "   Command: grep admin_space_left_action /etc/audit/auditd.conf"
grep admin_space_left_action /etc/audit/auditd.conf
echo "******Expect:  admin_space_left_action = halt"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 4.1.1.3 Ensure audit logs are not automatically deleted (L2 Scored)***"
echo "   Command: grep max_log_file_action /etc/audit/auditd.conf"
grep max_log_file_action /etc/audit/auditd.conf
echo "******Expect:  max_log_file_action = keep_logs"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 4.1.2 Ensure auditd service is enabled (L2 Scored)***"
echo "   Command: chkconfig --list auditd"
chkconfig --list auditd
echo "******Expect:  verify runlevels 2 through 5 are "on":"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 4.1.3 Ensure auditing for processes that start prior to auditd is enabled (L2 Scored)***"
echo "   Command: grep "^\s*kernel" /boot/grub/grub.conf"
grep "^\s*kernel" /boot/grub/grub.conf
echo "******Expect: each kernel line has the audit=1 parameter set "
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 4.1.4 Ensure events that modify date and time information are collected (L2 Scored)***"
echo "   Command: grep time-change /etc/audit/audit.rules"
grep time-change /etc/audit/audit.rules
echo "******Expect:  see benchmark, fail if no output"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 4.1.5 Ensure events that modify user/group information are collected (L2 Scored)***"
echo "   Command: grep identity /etc/audit/audit.rules"
grep identity /etc/audit/audit.rules
echo "******Expect: see benchmark, fail if no output "
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 4.1.6 Ensure events that modify the system's network environment are collected (L2 Scored)***"
echo "   Command: grep system-locale /etc/audit/audit.rules"
grep system-locale /etc/audit/audit.rules
echo "******Expect:  see benchmark, fail if no output"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 4.1.7 Ensure events that modify the system's Mandatory Access Controls are collected (L2 Scored)***"
echo "   Command: grep MAC-policy /etc/audit/audit.rules"
grep MAC-policy /etc/audit/audit.rules
echo "******Expect:  see benchmark, fail if no output"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 4.1.8 Ensure login and logout events are collected (L2 Scored)***"
echo "   Command: grep logins /etc/audit/audit.rules"
grep logins /etc/audit/audit.rules
echo "******Expect:  see benchmark, fail if no output"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 4.1.9 Ensure session initiation information is collected (L2 Scored)***"
echo "   Command: grep session /etc/audit/audit.rules"
grep session /etc/audit/audit.rules
echo "******Expect:  see benchmark, fail if no output"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 4.1.10 Ensure discretionary access control permission modification events are collected (L2 Scored)***"
echo "   Command: grep perm_mod /etc/audit/audit.rules"
grep perm_mod /etc/audit/audit.rules
echo "******Expect:  see benchmark, fail if no output"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 4.1.11 Ensure unsuccessful unauthorized file access attempts are collected (L2 Scored)***"
echo "   Command: grep access /etc/audit/audit.rules"
grep access /etc/audit/audit.rules
echo "******Expect:  see benchmark, fail if no output"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 4.1.12 Ensure use of privileged commands is collected (L2 Scored)***"
echo "   Command: [ESCAPED]"
# Manual find <partition> -xdev \( -perm -4000 -o -perm -2000 \) -type f | awk '{print "-a always,exit -F path=" $1 " -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged" }'
echo "******Expect:  Verify all resulting lines are in the /etc/audit/audit.rules"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 4.1.13 Ensure successful file system mounts are collected (L2 Scored)***"
echo "   Command: grep mounts /etc/audit/audit.rules"
grep mounts /etc/audit/audit.rules
echo "******Expect:  see benchmark, if no output, fail"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 4.1.14 Ensure file deletion events by users are collected (L2 Scored)***"
echo "   Command: grep delete /etc/audit/audit.rules"
grep delete /etc/audit/audit.rules
echo "******Expect:  see benchmark, fail if no output"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 4.1.15 Ensure changes to system administration scope (sudoers) is collected (L2 Scored)***"
echo "   Command: grep scope /etc/audit/audit.rules"
grep scope /etc/audit/audit.rules
echo "******Expect:  see benchmark, fail if no output"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 4.1.16 Ensure system administrator actions (sudolog) are collected (L2 Scored)***"
echo "   Command: grep actions /etc/audit/audit.rules"
grep actions /etc/audit/audit.rules
echo "******Expect: see benchmark, fail if no output "
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 4.1.17 Ensure kernel module loading and unloading is collected (L2 Scored)***"
echo "   Command: grep modules /etc/audit/audit.rules"
grep modules /etc/audit/audit.rules
echo "******Expect:  see benchmark, fail if no output"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 4.1.18 Ensure the audit configuration is immutable (L2 Scored)***"
echo "   Command: grep "^\s*[^#]" /etc/audit/audit.rules | tail -1"
grep "^\s*[^#]" /etc/audit/audit.rules | tail -1
echo "******Expect:  see benchmark, fail if no output"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 4.2 Configure Logging***"

echo "***CIS Ref: 4.2.1.1 Ensure rsyslog Service is enabled (Scored)***"
echo "   Command: chkconfig --list rsyslog"
chkconfig --list rsyslog
echo "******Expect:  runlevels 2 through 5 are on"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 4.2.1.2 Ensure logging is configured (Not Scored)***"
echo "   Command: /etc/rsyslog.confg/"
/etc/rsyslog.conf
echo "******Expect:  log rotation configured"
echo "   Command: ls -l /var/log/"
ls -l /var/log/
echo "******Expect: log rotation activit "
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 4.2.1.3 Ensure rsyslog default file permissions configured (Scored)***"
echo "   Command: grep ^\$FileCreateMode /etc/rsyslog.conf"
grep ^\$FileCreateMode /etc/rsyslog.conf
echo "******Expect: $FileCreateMode is 0640 or more restrictive "
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 4.2.1.4 Ensure rsyslog is configured to send logs to a remote log host (Scored)***"
echo "   Command: grep "^*.*[^I][^I]*@" /etc/rsyslog.conf"
grep "^*.*[^I][^I]*@" /etc/rsyslog.conf
echo "******Expect: *.* @@loghost.example.com -- log shipping host defined "
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 4.2.1.5 Ensure remote rsyslog messages are only accepted on designated log hosts. (Not Scored)***"
echo "   Command: grep '$ModLoad imtcp.so' /etc/rsyslog.conf"
grep '$ModLoad imtcp.so' /etc/rsyslog.conf
echo "******Expect:  $ModLoad imtcp.so"
echo "   Command: grep '$InputTCPServerRun' /etc/rsyslog.conf"
grep '$InputTCPServerRun' /etc/rsyslog.conf
echo "******Expect: $InputTCPServerRun 514"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 4.2.2.1 Ensure syslog-ng service is enabled (Scored)***"
echo "   Command: chkconfig --list syslog-ng"
chkconfig --list syslog-ng
echo "******Expect:  verify runlevels 2 through 5 are on"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 4.2.2.2 Ensure logging is configured (Not Scored)***"
echo "   Command: ls -l /var/log/"
cat /etc/syslog-ng/syslog-ng.conf
echo "******Expect:  logging is set"
echo "   Command: ls -l /var/log/"
ls -l /var/log/
echo "******Expect:  logs are rotating"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 4.2.2.3 Ensure syslog-ng default file permissions configured (Scored)***"
echo "   Command: grep ^options /etc/syslog-ng/syslog-ng.conf"
grep ^options /etc/syslog-ng/syslog-ng.conf
echo "******Expect:  perm option is 0640 or more restrictive:"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 4.2.2.4 Ensure syslog-ng is configured to send logs to a remote log host (Not Scored)***"
echo "   Command: cat /etc/syslog-ng/syslog-ng.conf"
cat /etc/syslog-ng/syslog-ng.conf
echo "******Expect:  destination logserver is defined"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 4.2.2.5 Ensure remote syslog-ng messages are only accepted on designated log hosts (Not Scored)***"
echo "   Command: #review previous conf"
#review previsou conf
echo "******Expect:    source net is defined| estination remote"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 4.2.3 Ensure rsyslog or syslog-ng is installed (Scored)***"
echo "   Command: rpm -q rsyslog"
rpm -q rsyslog
echo "   Command: rpm -q syslog-ng"
rpm -q syslog-ng
echo "******Expect:  at least one indicates the package is installed"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 4.2.4 Ensure permissions on all logfiles are configured (Scored)***"
echo "   Command: find /var/log -type f -ls"
find /var/log -type f -ls
echo "******Expect:  "
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 4.3 Ensure logrotate is configured (Not Scored)***"
echo "   Command: cat /etc/logrotate.conf"
cat /etc/logrotate.conf
echo "******Expect:  other has no permissions on any files and group does not have write or execute permissions on any files"
echo "--------------------------------------------------------------------------------------"



echo "======================================================================================"
echo "***CIS Ref: 5 Access, Authentication and Authorization***"


echo "***CIS Ref: 5.1 Configure cron***"

echo "***CIS Ref: 5.1.1 Ensure cron daemon is enabled (Scored)***"
echo "   Command: chkconfig --list crond"
chkconfig --list crond
echo "******Expect:  runlevels 2 through 5 are on"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 5.1.2 Ensure permissions on /etc/crontab are configured (Scored)***"
echo "   Command: stat /etc/crontab"
stat /etc/crontab
echo "******Expect:  Uid and Gid are both 0/root and Access does not grant permissions to group or other:"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 5.1.3 Ensure permissions on /etc/cron.hourly are configured (Scored)***"
echo "   Command: stat /etc/cron.hourly"
stat /etc/cron.hourly
echo "******Expect:  Uid and Gid are both 0/root and Access does not grant permissions to group or other"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 5.1.4 Ensure permissions on /etc/cron.daily are configured (Scored)***"
echo "   Command: stat /etc/cron.daily"
stat /etc/cron.daily
echo "******Expect:  Uid and Gid are both 0/root and Access does not grant permissions to group or other"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 5.1.5 Ensure permissions on /etc/cron.weekly are configured (Scored)***"
echo "   Command: stat /etc/cron.weekly"
stat /etc/cron.weekly
echo "******Expect:  Uid and Gid are both 0/root and Access does not grant permissions to group or other:"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 5.1.6 Ensure permissions on /etc/cron.monthly are configured (Scored)***"
echo "   Command: stat /etc/cron.monthly"
stat /etc/cron.monthly
echo "******Expect:  Uid and Gid are both 0/root and Access does not grant permissions to group or other:"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 5.1.7 Ensure permissions on /etc/cron.d are configured (Scored)***"
echo "   Command: stat /etc/cron.d"
stat /etc/cron.d
echo "******Expect: Uid and Gid are both 0/root and Access does not grant permissions to group or other: "
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 5.1.8 Ensure at/cron is restricted to authorized users (Scored)***"
echo "   Command: stat /etc/cron.deny "
stat /etc/cron.deny 
echo "******Expect:  does not exist"
echo "   Command: stat /etc/at.deny"
stat /etc/at.deny
echo "******Expect:  does not exist"
echo "   Command: stat /etc/cron.allow"
stat /etc/cron.allow
echo "******Expect:  Uid and Gid are both 0/root and Access does not grant permissions to group or other"
echo "   Command: stat /etc/at.allow"
stat /etc/at.allow
echo "******Expect:  Uid and Gid are both 0/root and Access does not grant permissions to group or other"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 5.2 SSH Server Configuration***"

echo "***CIS Ref: 5.2.1 Ensure permissions on /etc/ssh/sshd_config are configured (Scored)***"
echo "   Command: stat /etc/ssh/sshd_config"
stat /etc/ssh/sshd_config
echo "******Expect:  verify Uid and Gid are both 0/root and Access does not grant permissions to group or other"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 5.2.2 Ensure SSH Protocol is set to 2 (Scored)***"
echo "   Command: grep "^Protocol" /etc/ssh/sshd_config"
grep "^Protocol" /etc/ssh/sshd_config
echo "******Expect: Protocol 2 "
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 5.2.3 Ensure SSH LogLevel is set to INFO (Scored)***"
echo "   Command: grep "^LogLevel" /etc/ssh/sshd_config"
grep "^LogLevel" /etc/ssh/sshd_config
echo "******Expect: LogLevel INFO "
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 5.2.4 Ensure SSH X11 forwarding is disabled (Scored)***"
echo "   Command: grep "^X11Forwarding" /etc/ssh/sshd_config"
grep "^X11Forwarding" /etc/ssh/sshd_config
echo "******Expect: X11Forwarding no "
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 5.2.5 Ensure SSH MaxAuthTries is set to 4 or less (Scored)***"
echo "   Command: grep "^MaxAuthTries" /etc/ssh/sshd_config"
grep "^MaxAuthTries" /etc/ssh/sshd_config
echo "******Expect:  MaxAuthTries 4 or less"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 5.2.6 Ensure SSH IgnoreRhosts is enabled (Scored)***"
echo "   Command: grep "^IgnoreRhosts" /etc/ssh/sshd_config"
grep "^IgnoreRhosts" /etc/ssh/sshd_config
echo "******Expect:  IgnoreRhosts yes"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 5.2.7 Ensure SSH HostbasedAuthentication is disabled (Scored)***"
echo "   Command: grep "^HostbasedAuthentication" /etc/ssh/sshd_config"
grep "^HostbasedAuthentication" /etc/ssh/sshd_config
echo "******Expect:  HostbasedAuthentication no"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 5.2.8 Ensure SSH root login is disabled (Scored)***"
echo "   Command: grep "^PermitRootLogin" /etc/ssh/sshd_config"
grep "^PermitRootLogin" /etc/ssh/sshd_config
echo "******Expect:  PermitRootLogin no"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 5.2.9 Ensure SSH PermitEmptyPasswords is disabled (Scored)***"
echo "   Command: grep "^PermitEmptyPasswords" /etc/ssh/sshd_config"
grep "^PermitEmptyPasswords" /etc/ssh/sshd_config
echo "******Expect:  PermitEmptyPasswords no"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 5.2.10 Ensure SSH PermitUserEnvironment is disabled (Scored)***"
echo "   Command: grep PermitUserEnvironment /etc/ssh/sshd_config"
grep PermitUserEnvironment /etc/ssh/sshd_config
echo "******Expect:  PermitUserEnvironment no"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 5.2.11 Ensure only approved ciphers are used (Scored)***"
echo "   Command: grep "Ciphers" /etc/ssh/sshd_config"
grep "Ciphers" /etc/ssh/sshd_config
echo "******Expect: no unlisted Ciphers aes256-ctr,aes192-ctr,aes128-ctr,aes256-gcm@openssh.com,aes128-gcm@openssh.com,chacha20-poly1305@openssh.com"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 5.2.12 Ensure only approved MAC algorithms are used (Scored)***"
echo "   Command: grep "MACs" /etc/ssh/sshd_config"
grep "MACs" /etc/ssh/sshd_config
echo "******Expect:  no unlistedMACs hmac-sha2-512-etm@openssh.com,hmac-sha2-256-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-512,hmac-sha2-256,umac-128@openssh.com,curve25519-sha256@libssh.org,diffie-hellman-group-exchange-sha256"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 5.2.13 Ensure SSH Idle Timeout Interval is configured (Scored)***"
echo "   Command: grep "^ClientAliveInterval" /etc/ssh/sshd_config "
grep "^ClientAliveInterval" /etc/ssh/sshd_config 
echo "******Expect:  ClientAliveInterval 300"
echo "   Command:  grep "^ClientAliveCountMax" /etc/ssh/sshd_config"
 grep "^ClientAliveCountMax" /etc/ssh/sshd_config
echo "******Expect:  ClientAliveCountMax 0"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 5.2.14 Ensure SSH LoginGraceTime is set to one minute or less (Scored***"
echo "   Command: grep "^LoginGraceTime" /etc/ssh/sshd_config"
grep "^LoginGraceTime" /etc/ssh/sshd_config
echo "******Expect:  LoginGraceTime 60 or less"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 5.2.15 Ensure SSH access is limited (Scored)***"
echo "   Command: grep "^AllowUsers" /etc/ssh/sshd_config "
grep "^AllowUsers" /etc/ssh/sshd_config 
echo "******Expect: AllowUsers <userlist> "
echo "   Command: grep "^AllowGroups" /etc/ssh/sshd_config "
grep "^AllowGroups" /etc/ssh/sshd_config 
echo "******Expect: AllowGroups <grouplist> "
echo "   Command: grep "^DenyUsers" /etc/ssh/sshd_config "
grep "^DenyUsers" /etc/ssh/sshd_config 
echo "******Expect:  DenyUsers <userlist>"
echo "   Command: grep "^DenyGroups" /etc/ssh/sshd_config"
grep "^DenyGroups" /etc/ssh/sshd_config
echo "******Expect:  DenyGroups <grouplist>"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 5.2.16 Ensure SSH warning banner is configured (Scored)***"
echo "   Command: grep "^Banner" /etc/ssh/sshd_config"
grep "^Banner" /etc/ssh/sshd_config
echo "******Expect:  Banner /etc/issue.net"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 5.3 Configure PAM***"

echo "***CIS Ref: 5.3.1 Ensure password creation requirements are configured (Scored)***"
echo "   Command: grep pam_cracklib.so /etc/pam.d/password-auth"
grep pam_cracklib.so /etc/pam.d/password-auth
echo "******Expect:  password requisite pam_cracklib.so try_first_pass retry=3 minlen=14 dcredit=-1 ucredit=-1 ocredit=-1 lcredit=-1"
echo "   Command: grep pam_cracklib.so /etc/pam.d/system-auth"
grep pam_cracklib.so /etc/pam.d/system-auth
echo "******Expect:  password requisite pam_cracklib.so try_first_pass retry=3 minlen=14 dcredit=-1 ucredit=-1 ocredit=-1 lcredit=-1"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 5.3.2 Ensure lockout for failed password attempts is configured (Scored***"
echo "   Command: cat /etc/pam.d/password-auth"
cat /etc/pam.d/password-auth
echo "******Expect:  see the benchmark"
echo "   Command: cat /etc/pam.d/system-auth"
cat /etc/pam.d/system-auth
echo "******Expect:  see the benchmark"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 5.3.3 Ensure password reuse is limited (Scored***"
echo "   Command: egrep '^password\s+sufficient\s+pam_unix.so' /etc/pam.d/password-auth "
egrep '^password\s+sufficient\s+pam_unix.so' /etc/pam.d/password-auth 
echo "******Expect:  password sufficient pam_unix.so remember=5"
echo "   Command: egrep '^password\s+sufficient\s+pam_unix.so' /etc/pam.d/system-auth"
egrep '^password\s+sufficient\s+pam_unix.so' /etc/pam.d/system-auth
echo "******Expect:  password sufficient pam_unix.so remember=5"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 5.3.4 Ensure password hashing algorithm is SHA-512 (Scored)***"
echo "   Command: egrep '^password\s+sufficient\s+pam_unix.so' /etc/pam.d/password-auth "
egrep '^password\s+sufficient\s+pam_unix.so' /etc/pam.d/password-auth 
echo "******Expect: password sufficient pam_unix.so sha512 "
echo "   Command: egrep '^password\s+sufficient\s+pam_unix.so' /etc/pam.d/system-auth"
egrep '^password\s+sufficient\s+pam_unix.so' /etc/pam.d/system-auth
echo "******Expect: password sufficient pam_unix.so sha512 "
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 5.4 User Accounts and Environment***"

echo "***CIS Ref: 5.4.1.1 Ensure password expiration is 90 days or less (Scored)***"
echo "   Command: grep PASS_MAX_DAYS /etc/login.defs"
grep PASS_MAX_DAYS /etc/login.defs
echo "******Expect:  PASS_MAX_DAYS 90"
echo "   Command: egrep ^[^:]+:[^\!*] /etc/shadow | cut -d: -f1"
egrep ^[^:]+:[^\!*] /etc/shadow | cut -d: -f1
echo "******Expect:  <list of users>"
echo "   Command: #manual chage --list root"
 chage --list root
echo "******Expect: PASS_MAX_DAYS 90 "
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 5.4.1.2 Ensure minimum days between password changes is 7 or more (Scored) ***"
echo "   Command: grep PASS_MIN_DAYS /etc/login.defs"
grep PASS_MIN_DAYS /etc/login.defs
echo "******Expect:  PASS_MIN_DAYS 7"
echo "   Command: egrep ^[^:]+:[^\!*] /etc/shadow | cut -d: -f1 "
egrep ^[^:]+:[^\!*] /etc/shadow | cut -d: -f1 
echo "******Expect:  <list of users> "
echo "   Command: # manual chage --list <user>"
chage --list root
echo "******Expect:  "
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 5.4.1.3 Ensure password expiration warning days is 7 or more (Scored)***"
echo "   Command: grep PASS_WARN_AGE /etc/login.defs"
grep PASS_WARN_AGE /etc/login.defs
echo "******Expect:  "
echo "   Command: egrep ^[^:]+:[^\!*] /etc/shadow | cut -d: -f1"
egrep ^[^:]+:[^\!*] /etc/shadow | cut -d: -f1
echo "******Expect:  <list of users>"
echo "   Command: #manual # chage --list <user>"
chage --list root
echo "******Expect:  run other users"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 5.4.1.4 Ensure inactive password lock is 30 days or less (Scored)***"
echo "   Command: useradd -D | grep INACTIVE"
useradd -D | grep INACTIVE
echo "******Expect:  INACTIVE=30"
echo "   Command: egrep ^[^:]+:[^\!*] /etc/shadow | cut -d: -f1"
egrep ^[^:]+:[^\!*] /etc/shadow | cut -d: -f1
echo "******Expect:  <list of users>"
echo "   Command: # manual chage --list <user>"
chage --list root
echo "******Expect:  run other users"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 5.4.2 Ensure system accounts are non-login (Scored)***"
echo "   Command: egrep -v "^\+" /etc/passwd | awk -F: '($1!="root" && $1!="sync" && $1!="shutdown" && $1!="halt" && $3<500 && $7!="/sbin/nologin" && $7!="/bin/false") {print}'"
egrep -v "^\+" /etc/passwd | awk -F: '($1!="root" && $1!="sync" && $1!="shutdown" && $1!="halt" && $3<500 && $7!="/sbin/nologin" && $7!="/bin/false") {print}'
echo "******Expect: no results are returned "
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 5.4.3 Ensure default group for the root account is GID 0 (Scored)***"
echo "   Command: grep "^root:" /etc/passwd | cut -f4 -d:"
grep "^root:" /etc/passwd | cut -f4 -d:
echo "******Expect:  0"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 5.4.4 Ensure default user umask is 027 or more restrictive (Scored)***"
echo "   Command: grep "^umask" /etc/bashrc"
grep "^umask" /etc/bashrc
echo "******Expect:  umask 027"
echo "   Command: grep "^umask" /etc/profile"
grep "^umask" /etc/profile
echo "******Expect:  umask 027"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 5.5 Ensure root login is restricted to system console (Not Scored***"
echo "   Command: cat /etc/securetty"
cat /etc/securetty
echo "******Expect:  "
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 5.6 Ensure access to the su command is restricted (Scored)***"
echo "   Command: grep pam_wheel.so /etc/pam.d/su"
grep pam_wheel.so /etc/pam.d/su
echo "******Expect: auth required pam_wheel.so use_uid "
echo "   Command: grep wheel /etc/group"
grep wheel /etc/group
echo "******Expect:  wheel:x:10:root,<user list>"
echo "--------------------------------------------------------------------------------------"



echo "======================================================================================"
echo "***CIS Ref: 6 System Maintenance***"

echo "***CIS Ref: 6.1 System File Permissions***"

echo "***CIS Ref: 6.1.1 Audit system file permissions (L2 Not Scored)***"
echo "   Command: rpm -Va --nomtime --nosize --nomd5 --nolinkto "
rpm -Va --nomtime --nosize --nomd5 --nolinkto 
echo "******Expect: look for weird packages "
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 6.1.2 Ensure permissions on /etc/passwd are configured (Scored)***"
echo "   Command: stat /etc/passwd"
stat /etc/passwd
echo "******Expect:  Uid and Gid are both 0/root and Access is 644:"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 6.1.3 Ensure permissions on /etc/shadow are configured (Scored)***"
echo "   Command: stat /etc/shadow"
stat /etc/shadow
echo "******Expect:  Uid and Gid are 0/root, and Access is 000:"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 6.1.4 Ensure permissions on /etc/group are configured (Scored)***"
echo "   Command: stat /etc/group"
stat /etc/group
echo "******Expect:  Uid and Gid are both 0/root and Access is 644"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 6.1.5 Ensure permissions on /etc/gshadow are configured (Scored)***"
echo "   Command: stat /etc/gshadow"
stat /etc/gshadow
echo "******Expect:  "
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 6.1.6 Ensure permissions on /etc/passwd- are configured (Scored)***"
echo "   Command: stat /etc/passwd-"
stat /etc/passwd-
echo "******Expect:  Uid and Gid are 0/root, and Access is 000:"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 6.1.7 Ensure permissions on /etc/shadow- are configured (Scored)***"
echo "   Command: stat /etc/shadow-"
stat /etc/shadow-
echo "******Expect:  Uid and Gid are both 0/root and Access is 600"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 6.1.8 Ensure permissions on /etc/group- are configured (Scored)***"
echo "   Command: stat /etc/group-"
stat /etc/group-
echo "******Expect:  Uid and Gid are both 0/root and Access is 600"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 6.1.9 Ensure permissions on /etc/gshadow- are configured (Scored)***"
echo "   Command: stat /etc/gshadow-"
stat /etc/gshadow-
echo "******Expect:  Uid and Gid are both 0/root and Access is 600"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 6.1.10 Ensure no world writable files exist (Scored)***"
echo "   Command: df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -type f -perm -0002"
df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -type f -perm -0002
echo "******Expect:  nothing returned"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 6.1.11 Ensure no unowned files or directories exist (Scored)***"
echo "   Command: df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -nouser"
df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -nouser
echo "******Expect:  no files are returned"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 6.1.12 Ensure no ungrouped files or directories exist (Scored)***"
echo "   Command: df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -nogroup"
df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -nogroup
echo "******Expect: no files are returned "
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 6.1.13 Audit SUID executables (Not Scored)***"
echo "   Command: df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -type f -perm -4000"
df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -type f -perm -4000
echo "******Expect: no custom files are returned "
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 6.1.14 Audit SGID executables (Not Scored)***"
echo "   Command: df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -type f -perm -2000"
df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -type f -perm -2000
echo "******Expect:  no custom files are returned"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 6.2 User and Group Settings***"


echo "***CIS Ref: 6.2.1 Ensure password fields are not empty (Scored)***"
echo "   Command: cat /etc/shadow | awk -F: '($2 == "" ) { print $1 " does not have a password "}'"
cat /etc/shadow | awk -F: '($2 == "" ) { print $1 " does not have a password "}'
echo "******Expect:  no output is returned"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 6.2.2 Ensure no legacy "+" entries exist in /etc/passwd (Scored)***"
echo "   Command: grep '^+:' /etc/passwd"
grep '^+:' /etc/passwd
echo "******Expect:  no output is returned"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 6.2.3 Ensure no legacy "+" entries exist in /etc/shadow (Scored)***"
echo "   Command: grep '^+:' /etc/shadow"
grep '^+:' /etc/shadow
echo "******Expect:  no output is returned"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 6.2.4 Ensure no legacy "+" entries exist in /etc/group (Scored)***"
echo "   Command: grep '^+:' /etc/group"
grep '^+:' /etc/group
echo "******Expect:  no output is returned"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 6.2.5 Ensure root is the only UID 0 account (Scored)***"
echo "   Command: cat /etc/passwd | awk -F: '($3 == 0) { print $1 }'"
cat /etc/passwd | awk -F: '($3 == 0) { print $1 }'
echo "******Expect:  only root"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 6.2.6 Ensure root PATH Integrity (Scored)***"
if [ "`echo $PATH | grep :: `" != "" ]; then 
   echo "Empty Directory in PATH (::)" 
fi
if [ "`echo $PATH | grep :$`" != "" ]; then 
  echo "Trailing : in PATH" 
fi 
p=`echo $PATH | sed -e 's/::/:/' -e 's/:$//' -e 's/:/ /g'` 
set -- $p 
while [ "$1" != "" ]; do 
  if [ "$1" = "." ]; then
    echo "PATH contains ." 
    shift 
    continue 
  fi 
  if [ -d $1 ]; then
     dirperm=`ls -ldH $1 | cut -f1 -d" "` 
     if [ `echo $dirperm | cut -c6 ` != "-" ]; then 
       echo "Group Write permission set on directory $1" 
     fi 
     if [ `echo $dirperm | cut -c9 ` != "-" ]; then 
       echo "Other Write permission set on directory $1" 
     fi
     dirown=`ls -ldH $1 | awk '{print $3}'` 
     if [ "$dirown" != "root" ] ; then 
       echo $1 is not owned by root 
     fi 
   else 
       echo $1 is not a directory
   fi 
  shift 
done
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 6.2.7 Ensure all users' home directories exist (Scored)***"
cat /etc/passwd | awk -F: '{ print $1 " " $3 " " $6 }' | while read user uid dir; do
  if [ $uid -ge 500 -a ! -d "$dir" -a $user != "nfsnobody" ]; then 
    echo "The home directory ($dir) of user $user does not exist." 
  fi 
done
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 6.2.8 Ensure users' home directories permissions are 750 or more restrictive (Scored)***"
for dir in `cat /etc/passwd | egrep -v '(root|halt|sync|shutdown)' | awk -F: '($7 != "/sbin/nologin") { print $6 }'`; do 
  dirperm=`ls -ld $dir | cut -f1 -d" "` 
  if [ `echo $dirperm | cut -c6 ` != "-" ]; then 
    echo "Group Write permission set on directory $dir" 
  fi 
  if [ `echo $dirperm | cut -c8 ` != "-" ]; then
    echo "Other Read permission set on directory $dir" 
  fi
  if [ `echo $dirperm | cut -c9 ` != "-" ]; then 
    echo "Other Write permission set on directory $dir" 
  fi 
  if [ `echo $dirperm | cut -c10 ` != "-" ]; then 
    echo "Other Execute permission set on directory $dir" 
  fi 
done
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 6.2.9 Ensure users own their home directories (Scored)***"
cat /etc/passwd | awk -F: '{ print $1 " " $3 " " $6 }' | while read user uid dir; do
  if [ $uid -ge 500 -a -d "$dir" -a $user != "nfsnobody" ]; then
    owner=$(stat -L -c "%U" "$dir") 
    if [ "$owner" != "$user" ]; then 
      echo "The home directory ($dir) of user $user is owned by $owner." 
    fi
  fi
done
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 6.2.10 Ensure users' dot files are not group or world writable (Scored)***"
for dir in `cat /etc/passwd | egrep -v '(root|sync|halt|shutdown)' | awk -F: '($7 != "/sbin/nologin") { print $6 }'`; do 
  for file in $dir/.[A-Za-z0-9]*; do
    if [ ! -h "$file" -a -f "$file" ]; then 
      fileperm=`ls -ld $file | cut -f1 -d" "` 
      if [ `echo $fileperm | cut -c6 ` != "-" ]; then 
        echo "Group Write permission set on file $file" 
      fi 
      if [ `echo $fileperm | cut -c9 ` != "-" ]; then
        echo "Other Write permission set on file $file" 
      fi 
    fi 
  done 
done
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 6.2.11 Ensure no users have .forward files (Scored)***"
for dir in `cat /etc/passwd | awk -F: '{ print $6 }'`; do 
  if [ ! -h "$dir/.forward" -a -f "$dir/.forward" ]; then
    echo ".forward file $dir/.forward exists" 
  fi 
done
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 6.2.12 Ensure no users have .netrc files (Scored)***"
for dir in `cat /etc/passwd | awk -F: '{ print $6 }'`; do 
  if [ ! -h "$dir/.netrc" -a -f "$dir/.netrc" ]; then
    echo ".netrc file $dir/.netrc exists" 
  fi 
done
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 6.2.13 Ensure users' .netrc Files are not group or world accessible (Scored)***"
for dir in `cat /etc/passwd | egrep -v '(root|sync|halt|shutdown)' | awk -F: '($7 != "/sbin/nologin") { print $6 }'`; do 
  for file in $dir/.netrc; do 
    if [ ! -h "$file" -a -f "$file" ]; then 
      fileperm=`ls -ld $file | cut -f1 -d" "` 
      if [ `echo $fileperm | cut -c5 ` != "-" ]; then 
        echo "Group Read set on $file"
      fi
      if [ `echo $fileperm | cut -c6 ` != "-" ]; then 
        echo "Group Write set on $file" 
      fi 
      if [ `echo $fileperm | cut -c7 ` != "-" ]; then 
         echo "Group Execute set on $file" 
      fi 
      if [ `echo $fileperm | cut -c8 ` != "-" ]; then 
        echo "Other Read set on $file" 
      fi
      if [ `echo $fileperm | cut -c9 ` != "-" ]; then 
        echo "Other Write set on $file" 
      fi 
      if [ `echo $fileperm | cut -c10 ` != "-" ]; then 
        echo "Other Execute set on $file" 
      fi
    fi 
  done
done
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 6.2.14 Ensure no users have .rhosts files (Scored)***"
for dir in `cat /etc/passwd | egrep -v '(root|halt|sync|shutdown)' | awk -F: '($7 != "/sbin/nologin") { print $6 }'`; do 
  for file in $dir/.rhosts; do 
    if [ ! -h "$file" -a -f "$file" ]; then 
      echo ".rhosts file in $dir" 
    fi 
  done 
done
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 6.2.15 Ensure all groups in /etc/passwd exist in /etc/group (Scored)***"
for i in $(cut -s -d: -f4 /etc/passwd | sort -u ); do 
  grep -q -P "^.*?:[^:]*:$i:" /etc/group 
  if [ $? -ne 0 ]; then 
    echo "Group $i is referenced by /etc/passwd but does not exist in /etc/group" 
  fi
done
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 6.2.16 Ensure no duplicate UIDs exist (Scored)***"
cat /etc/passwd | cut -f3 -d":" | sort -n | uniq -c | while read x ; do 
  [ -z "${x}" ] && break
  set - $x
  if [ $1 -gt 1 ]; then
    users=`awk -F: '($3 == n) { print $1 }' n=$2 /etc/passwd | xargs` 
    echo "Duplicate UID ($2): ${users}" 
  fi 
done
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 6.2.17 Ensure no duplicate GIDs exist (Scored)***"
cat /etc/group | cut -f3 -d":" | sort -n | uniq -c | while read x ; do 
  [ -z "${x}" ] && break 
  set - $x 
  if [ $1 -gt 1 ]; then 
    groups=`awk -F: '($3 == n) { print $1 }' n=$2 /etc/group | xargs` 
    echo "Duplicate GID ($2): ${groups}"
  fi
done
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 6.2.18 Ensure no duplicate user names exist (Scored)***"
cat /etc/passwd | cut -f1 -d":" | sort -n | uniq -c | while read x ; do 
  [ -z "${x}" ] && break 
  set - $x
  if [ $1 -gt 1 ]; then 
    uids=`awk -F: '($1 == n) { print $3 }' n=$2 /etc/passwd | xargs` 
    echo "Duplicate User Name ($2): ${uids}" 
  fi 
done
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 6.2.19 Ensure no duplicate group names exist (Scored)***"
cat /etc/group | cut -f1 -d":" | sort -n | uniq -c | while read x ; do 
  [ -z "${x}" ] && break 
  set - $x 
  if [ $1 -gt 1 ]; then 
    gids=`gawk -F: '($1 == n) { print $3 }' n=$2 /etc/group | xargs`
    echo "Duplicate Group Name ($2): ${gids}" 
  fi
done
echo "--------------------------------------------------------------------------------------"
