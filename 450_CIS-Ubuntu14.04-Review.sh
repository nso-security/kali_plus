#!/bin/bash
echo "***CIS Ref: Ubuntu 14.04 – CIS Benchmark***"
#  run this file as the following to get output and error
# ./450_CIS-Ubuntu14.04-Review.sh > /tmp/file.txt 2>&1
echo "***CIS Ref: CIS Benchmark Index***"
echo "======================================================================================"
echo "***CIS Ref: 1 Patching and Software Updates***"




echo "***CIS Ref: 1.1 Install Updates, Patches and Additional Security Software (Not Scored)***"
echo "   Command: apt-get update "
apt-get update 
echo "   Command: apt-get --just-print upgrade"
apt-get --just-print upgrade




echo "======================================================================================"
echo "***CIS Ref: 2 Filesystem Configuration***"

echo "***General Reference***"
echo "   Command: cat /etc/fstab"
cat /etc/fstab


echo "***CIS Ref: 2.1 Create Separate Partition for /tmp (Scored)***"
echo "   [Escaped command]"
grep "[[:space:]]/tmp[[:space:]]" /etc/fstab
echo "******Expect: Some output, otherwise fail"
echo "--------------------------------------------------------------------------------------"



echo "***CIS Ref: 2.2 Set nodev option for /tmp Partition (Scored)***"
echo "   Command: grep /tmp /etc/fstab | grep nodev "
grep /tmp /etc/fstab | grep nodev 
echo "   Command: mount | grep /tmp | grep nodev"
mount | grep /tmp | grep nodev
echo "******Expect: Output from both, otherwise fail"
echo "--------------------------------------------------------------------------------------"



echo "***CIS Ref: 2.3 Set nosuid option for /tmp Partition (Scored)***"
echo "   Command: grep /tmp /etc/fstab | grep nosuid "
grep /tmp /etc/fstab | grep nosuid 
echo "   Command: mount | grep /tmp | grep nosuid"
mount | grep /tmp | grep nosuid
echo "******Expect: Output from both, otherwise fail"
echo "--------------------------------------------------------------------------------------"



echo "***CIS Ref: 2.4 Set noexec option for /tmp Partition (Scored)***"
echo "   Command: grep /tmp /etc/fstab | grep noexec "
grep /tmp /etc/fstab | grep noexec 
echo "   Command: mount | grep /tmp | grep noexec"
mount | grep /tmp | grep noexec
echo "******Expect: Output from both, otherwise fail"
echo "--------------------------------------------------------------------------------------"



echo "***CIS Ref: 2.5 Create Separate Partition for /var (Scored)***"
echo "   [ESCAPED COMMAND]"
grep "[[:space:]]/var[[:space:]]" /etc/fstab
echo "******Expect: some output, otherwise fail"
echo "--------------------------------------------------------------------------------------"



echo "***CIS Ref: 2.6 Bind Mount the /var/tmp directory to /tmp (Scored)***"
echo "   [ESCAPED COMMAND]"
grep -e "^/tmp" /etc/fstab | grep /var/tmp
echo "   [ESCAPED COMMAND]"
mount | grep -e "^/tmp" | grep /var/tmp
echo "******Expect: Output from both, otherwise fail"
echo "--------------------------------------------------------------------------------------"



echo "***CIS Ref: 2.7 Create Separate Partition for /var/log (Scored)***"
echo "   Command: [ESCAPED]"
grep "[[:space:]]/var/log[[:space:]]" /etc/fstab
echo "******Expect: Some output, otherwise fail"
echo "--------------------------------------------------------------------------------------"



echo "***CIS Ref: 2.8 Create Separate Partition for /var/log/audit (Scored)***"
echo "   Command: grep [[:space:]]/var/log/audit[[:space:]] /etc/fstab"
grep "[[:space:]]/var/log/audit[[:space:]]" /etc/fstab
echo "******Expect: Some output, otherwise fail"
echo "--------------------------------------------------------------------------------------"



echo "***CIS Ref: 2.9 Create Separate Partition for /home (Scored)***"
echo "   Command: grep [[:space:]]/home[[:space:]] /etc/fstab"
grep "[[:space:]]/home[[:space:]]" /etc/fstab
echo "******Expect: Some output, otherwise fail"
echo "--------------------------------------------------------------------------------------"



echo "***CIS Ref: 2.10 Add nodev Option to /home (Scored)***"
echo "   Command: grep /home /etc/fstab | grep nodev "
grep /home /etc/fstab | grep nodev 
echo "   Command: mount | grep /home | grep nodev"
mount | grep /home | grep nodev
echo "******Expect: Some output, otherwise fail"
echo "--------------------------------------------------------------------------------------"



echo "***CIS Ref: 2.11 Add nodev Option to Removable Media Partitions (Not Scored)***"
echo "   Command: grep <each removable media mountpoint> /etc/fstab"
# manual grep <each removable media mountpoint> /etc/fstab
echo "******Expect: manual Review required"
echo "--------------------------------------------------------------------------------------"



echo "***CIS Ref: 2.12 Add noexec Option to Removable Media Partitions (Not Scored)***"
echo "   Command: # manual grep <each removable media mountpoint> /etc/fstab"
# manual grep <each removable media mountpoint> /etc/fstab
echo "******Expect: manual Review required"
echo "--------------------------------------------------------------------------------------"



echo "***CIS Ref: 2.13 Add nosuid Option to Removable Media Partitions (Not Scored)***"
echo "   Command: #manual grep <each removable media mountpoint> /etc/fstab"
#manual grep <each removable media mountpoint> /etc/fstab
echo "******Expect: manual Review required"
echo "--------------------------------------------------------------------------------------"



echo "***CIS Ref: 2.14 Add nodev Option to /run/shm Partition (Scored)***"
echo "   Command: grep /run/shm /etc/fstab | grep nodev "
grep /run/shm /etc/fstab | grep nodev 
echo "   Command: mount | grep /run/shm | grep nodev"
mount | grep /run/shm | grep nodev
echo "******Expect: output from both commands, otherwise fail"
echo "--------------------------------------------------------------------------------------"



echo "***CIS Ref: 2.15 Add nosuid Option to /run/shm Partition (Scored)***"
echo "   Command: grep /run/shm /etc/fstab | grep nosuid "
grep /run/shm /etc/fstab | grep nosuid 
echo "   Command: mount | grep /run/shm | grep nosuid"
mount | grep /run/shm | grep nosuid
echo "******Expect: output from both commands, otherwise fail"
echo "--------------------------------------------------------------------------------------"



echo "***CIS Ref: 2.16 Add noexec Option to /run/shm Partition (Scored)***"
echo "   Command: grep /run/shm /etc/fstab | grep noexec # mount | grep /run/shm | grep noexec"
grep /run/shm /etc/fstab | grep noexec # mount | grep /run/shm | grep noexec
echo "******Expect: output from both commands, otherwise fail"
echo "--------------------------------------------------------------------------------------"



echo "***CIS Ref: 2.17 Set Sticky Bit on All World-Writable Directories (Scored)***"
echo "   Command: df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -type d \( -perm -0002 -a ! -perm -1000 \) 2>/dev/null"
df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -type d \( -perm -0002 -a ! -perm -1000 \) 2>/dev/null




echo "***CIS Ref: 2.18 Disable Mounting of cramfs Filesystems (L2 Not Scored)***"
echo "   Command: /sbin/modprobe -n -v cramfs  "
/sbin/modprobe -n -v cramfs  
echo "   Command: /sbin/lsmod | grep cramfs"
/sbin/lsmod | grep cramfs
echo "******Expect: output 'install /bin/true' from first and no output from 2nd, otherwise fail"
echo "--------------------------------------------------------------------------------------"



echo "***CIS Ref: 2.19 Disable Mounting of freevxfs Filesystems (L2 Not Scored)***"
echo "   Command: /sbin/modprobe -n -v freevxfs "
/sbin/modprobe -n -v freevxfs 
echo "   Command: /sbin/lsmod | grep freexvfs"
/sbin/lsmod | grep freexvfs
echo "******Expect: output 'install /bin/true' from first and no output from 2nd, otherwise fail"
echo "--------------------------------------------------------------------------------------"




echo "***CIS Ref: 2.20 Disable Mounting of jffs2 Filesystems (L2 Not Scored)***"
echo "   Command: /sbin/modprobe -n -v jffs2"
/sbin/modprobe -n -v jffs2
echo "   Command: /sbin/lsmod | grep jffs2"
/sbin/lsmod | grep jffs2
echo "******Expect: output 'install /bin/true' from first and no output from 2nd, otherwise fail"
echo "--------------------------------------------------------------------------------------"



echo "***CIS Ref: 2.21 Disable Mounting of hfs Filesystems (L2 Not Scored)***"
echo "   Command: /sbin/modprobe -n -v hfs "
/sbin/modprobe -n -v hfs 
echo "   Command: /sbin/lsmod | grep hfs"
/sbin/lsmod | grep hfs
echo "******Expect: output 'install /bin/true' from first and no output from 2nd, otherwise fail"
echo "--------------------------------------------------------------------------------------"



echo "***CIS Ref: 2.22 Disable Mounting of hfsplus Filesystems (L2 Not Scored)***"
echo "   Command: /sbin/modprobe -n -v hfsplus /sbin/lsmod | grep hfsplus"
/sbin/modprobe -n -v hfsplus 
echo "   Command: /sbin/lsmod | grep hfsplus"
/sbin/lsmod | grep hfsplus
echo "******Expect: output 'install /bin/true' from first and no output from 2nd, otherwise fail"
echo "--------------------------------------------------------------------------------------"



echo "***CIS Ref: 2.23 Disable Mounting of squashfs Filesystems (L2 Not Scored)***"
echo "   Command: /sbin/modprobe -n -v squashfs install"
/sbin/modprobe -n -v squashfs install
echo "   Command: /sbin/lsmod | grep squashfs"
/sbin/lsmod | grep squashfs
echo "******Expect: output 'install /bin/true' from first and no output from 2nd, otherwise fail"
echo "--------------------------------------------------------------------------------------"



echo "***CIS Ref: 2.24 Disable Mounting of udf Filesystems (L2 Not Scored)***"
echo "   Command: /sbin/modprobe -n -v udf "
/sbin/modprobe -n -v udf 
echo "   Command: /sbin/lsmod | grep udf"
/sbin/lsmod | grep udf
echo "******Expect: output 'install /bin/true' from first and no output from 2nd, otherwise fail"
echo "--------------------------------------------------------------------------------------"



echo "***CIS Ref: 2.25 Disable Automounting (L2 Scored)***"
echo "   Command: initctl show-config autofs"
initctl show-config autofs
echo "******Expect: no start conditions listed for autofs:, otherwise fail"
echo "--------------------------------------------------------------------------------------"

echo "======================================================================================"
echo "***CIS Ref: 3 Secure Boot Settings***"

echo "***CIS Ref: 3.1 Set User/Group Owner on bootloader config (Scored)***"
echo "   Command: stat -c %u %g /boot/grub/grub.cfg | egrep "^0 0""
stat -c "%u %g" /boot/grub/grub.cfg | egrep "^0 0"
echo "******Expect: some output:, otherwise fail"
echo "--------------------------------------------------------------------------------------"



echo "***CIS Ref: 3.2 Set Permissions on bootloader config (Scored)***"
echo "   Command: stat -L -c '%a' /boot/grub/grub.cfg | egrep ".00""
stat -L -c "%a" /boot/grub/grub.cfg | egrep ".00"
echo "******Expect: some output, otherwise fail"
echo "--------------------------------------------------------------------------------------"



echo "***CIS Ref: 3.3 Set Boot Loader Password (Scored)***"
echo "   Command: grep '^set superusers' /boot/grub/grub.cfg "
grep "^set superusers" /boot/grub/grub.cfg 
echo "   Command: grep '^password' /boot/grub/grub.cfg"
grep "^password" /boot/grub/grub.cfg
echo "******Expect: some output from both, otherwise fail"
echo "--------------------------------------------------------------------------------------"



echo "***CIS Ref: 3.4 Require Authentication for Single-User Mode (Scored)***"
echo "   Command: grep ^root:[*\!]: /etc/shadow"
# run manually, don't save to file
# grep ^root:[*\!]: /etc/shadow
echo "******Expect: run manually and no results should be returned, otherwise fail"
echo "--------------------------------------------------------------------------------------"


echo "======================================================================================"
echo "***CIS Ref: 4 Additional Process Hardening***"

echo "***CIS Ref: 4.1 Restrict Core Dumps (Scored)***"
echo "   Command: grep 'hard core' /etc/security/limits.conf "
grep "hard core" /etc/security/limits.conf
echo "******Expect:* hard core 0"
echo "   Command: sysctl fs.suid_dumpable"
sysctl fs.suid_dumpable
echo "******Expect:fs.suid_dumpable = 0"
echo "   Command: initctl show-config apport"
initctl show-config apport
echo "******Expect:apport"
echo "   Command: initctl show-config whoopsie"
initctl show-config whoopsie
echo "******Expect:whoopsie"

echo "***CIS Ref: 4.2 Enable XD/NX Support on 32-bit x86 Systems (Not Scored)***"
echo "   Command: dmesg | grep NX"
dmesg | grep NX




echo "***CIS Ref: 4.3 Enable Randomized Virtual Memory Region Placement (Scored)***"
echo "   Command: sysctl kernel.randomize_va_space"
sysctl kernel.randomize_va_space




echo "***CIS Ref: 4.4 Disable Prelink (Scored)***"
echo "   Command: dpkg -s prelink"
dpkg -s prelink




echo "***CIS Ref: 4.5 Activate AppArmor (L2 Scored)***"
echo "   Command: apparmor_status"
apparmor_status




echo "***CIS Ref: 5 OS Services***"




echo "***CIS Ref: 5.1 Ensure Legacy Services are Not Enabled***"




echo "***CIS Ref: 5.1.1 Ensure NIS is not installed (Scored)***"
echo "   Command: dpkg -s nis"
dpkg -s nis




echo "***CIS Ref: 5.1.2 Ensure rsh server is not enabled (Scored)***"
echo "   Command: grep ^shell /etc/inetd.conf "
grep ^shell /etc/inetd.conf 
echo "   Command: grep ^login /etc/inetd.conf "
grep ^login /etc/inetd.conf 
echo "   Command: grep ^exec /etc/inetd.conf"
grep ^exec /etc/inetd.conf




echo "***CIS Ref: 5.1.3 Ensure rsh client is not installed (Scored)***"
echo "   Command: dpkg -s rsh-client "
dpkg -s rsh-client 
echo "   Command: dpkg -s rsh-redone-client"
dpkg -s rsh-redone-client




echo "***CIS Ref: 5.1.4 Ensure talk server is not enabled (Scored)***"
echo "   Command: grep ^talk /etc/inetd.conf "
grep ^talk /etc/inetd.conf 
echo "   Command: grep ^ntalk /etc/inetd.conf"
grep ^ntalk /etc/inetd.conf




echo "***CIS Ref: 5.1.5 Ensure talk client is not installed (Scored)***"
echo "   Command: dpkg -s talk"
dpkg -s talk




echo "***CIS Ref: 5.1.6 Ensure telnet server is not enabled (Scored)***"
echo "   Command: grep ^telnet /etc/inetd.conf"
grep ^telnet /etc/inetd.conf




echo "***CIS Ref: 5.1.7 Ensure tftp-server is not enabled (Scored)***"
echo "   Command: grep ^tftp /etc/inetd.conf"
grep ^tftp /etc/inetd.conf




echo "***CIS Ref: 5.1.8 Ensure xinetd is not enabled (Scored)***"
echo "   Command: initctl show-config xinetd"
initctl show-config xinetd




echo "***CIS Ref: 5.2 Ensure chargen is not enabled (Scored)***"
echo "   Command: grep ^chargen /etc/inetd.conf"
grep ^chargen /etc/inetd.conf




echo "***CIS Ref: 5.3 Ensure daytime is not enabled (Scored)***"
echo "   Command: grep ^daytime /etc/inetd.conf"
grep ^daytime /etc/inetd.conf




echo "***CIS Ref: 5.4 Ensure echo is not enabled (Scored)***"
echo "   Command: grep ^echo /etc/inetd.conf"
grep ^echo /etc/inetd.conf




echo "***CIS Ref: 5.5 Ensure discard is not enabled (Scored)***"
echo "   Command: grep ^discard /etc/inetd.conf"
grep ^discard /etc/inetd.conf




echo "***CIS Ref: 5.6 Ensure time is not enabled (Scored)***"
echo "   Command: grep ^time /etc/inetd.conf"
grep ^time /etc/inetd.conf




echo "***CIS Ref: 6 Special Purpose Services***"




echo "***CIS Ref: 6.1 Ensure the X Window system is not installed (Scored)***"
echo "   Command: dpkg -l xserver-xorg-core*"
dpkg -l xserver-xorg-core*




echo "***CIS Ref: 6.2 Ensure Avahi Server is not enabled (Scored)***"
echo "   Command: initctl show-config avahi-daemon"
initctl show-config avahi-daemon




echo "***CIS Ref: 6.3 Ensure print server is not enabled (Not Scored)***"
echo "   Command: initctl show-config cups"
initctl show-config cups




echo "***CIS Ref: 6.4 Ensure DHCP Server is not enabled (Scored)***"
echo "   Command: initctl show-config isc-dhcp-server "
initctl show-config isc-dhcp-server 
echo "   Command: initctl show-config isc-dhcp-server6"
initctl show-config isc-dhcp-server6




echo "***CIS Ref: 6.5 Configure Network Time Protocol (NTP) (Scored)***"
echo "   Command: dpkg -s ntp"
dpkg -s ntp
echo "   Command: grep 'restrict .* default' /etc/ntp.conf"
grep "restrict .* default" /etc/ntp.conf
echo "   Command: grep '^server' /etc/ntp.conf"
grep "^server" /etc/ntp.conf
echo "   Command: grep 'RUNASUSER=ntp' /etc/init.d/ntp"
grep "RUNASUSER=ntp" /etc/init.d/ntp




echo "***CIS Ref: 6.6 Ensure LDAP is not enabled (Not Scored)***"
echo "   Command: dpkg -s slapd"
dpkg -s slapd




echo "***CIS Ref: 6.7 Ensure NFS and RPC are not enabled (Not Scored)***"
echo "   Command: initctl show-config rpcbind-boot"
initctl show-config rpcbind-boot
echo "   Command: ls /etc/rc*.d/S*nfs-kernel-server"
ls /etc/rc*.d/S*nfs-kernel-server




echo "***CIS Ref: 6.8 Ensure DNS Server is not enabled (Not Scored)***"
echo "   Command: ls /etc/rc*.d/S*bind9"
ls /etc/rc*.d/S*bind9




echo "***CIS Ref: 6.9 Ensure FTP Server is not enabled (Not Scored)***"
echo "   Command: initctl show-config vsftpd"
initctl show-config vsftpd




echo "***CIS Ref: 6.10 Ensure HTTP Server is not enabled (Not Scored)***"
echo "   Command: ls /etc/rc*.d/S*apache2"
ls /etc/rc*.d/S*apache2




echo "***CIS Ref: 6.11 Ensure IMAP and POP server is not enabled (Not Scored)***"
echo "   Command: initctl show-config dovecot"
initctl show-config dovecot




echo "***CIS Ref: 6.12 Ensure Samba is not enabled (Not Scored)***"
echo "   Command: initctl show-config smbd"
initctl show-config smbd




echo "***CIS Ref: 6.13 Ensure HTTP Proxy Server is not enabled (Not Scored)***"
echo "   Command: initctl show-config squid3"
initctl show-config squid3




echo "***CIS Ref: 6.14 Ensure SNMP Server is not enabled (Not Scored)***"
echo "   Command: ls /etc/rc*.d/S*snmpd"
ls /etc/rc*.d/S*snmpd




echo "***CIS Ref: 6.15 Configure Mail Transfer Agent for Local-Only Mode (Scored)***"
echo "   Command: netstat -an | grep LIST | grep ':25[[:space:]]'"
netstat -an | grep LIST | grep ":25[[:space:]]"




echo "***CIS Ref: 6.16 Ensure rsync service is not enabled (Scored)***"
echo "   Command: grep ^RSYNC_ENABLE /etc/default/rsync"
grep ^RSYNC_ENABLE /etc/default/rsync




echo "***CIS Ref: 6.17 Ensure Biosdevname is not enabled (Scored)***"
echo "   Command: dpkg -s biosdevname"
dpkg -s biosdevname




echo "***CIS Ref: 7 Network Configuration and Firewalls***"




echo "***CIS Ref: 7.1 Modify Network Parameters (Host Only)***"




echo "***CIS Ref: 7.1.1 Disable IP Forwarding (Scored)***"
echo "   Command: /sbin/sysctl net.ipv4.ip_forward"
/sbin/sysctl net.ipv4.ip_forward




echo "***CIS Ref: 7.1.2 Disable Send Packet Redirects (Scored)***"
echo "   Command: /sbin/sysctl net.ipv4.conf.all.send_redirects "
/sbin/sysctl net.ipv4.conf.all.send_redirects 
echo "   Command: /sbin/sysctl net.ipv4.conf.default.send_redirects"
/sbin/sysctl net.ipv4.conf.default.send_redirects




echo "***CIS Ref: 7.2 Modify Network Parameters (Host and Router)***"




echo "***CIS Ref: 7.2.1 Disable Source Routed Packet Acceptance (Scored)***"
echo "   Command: /sbin/sysctl net.ipv4.conf.all.accept_source_route"
/sbin/sysctl net.ipv4.conf.all.accept_source_route
echo "   Command: /sbin/sysctl net.ipv4.conf.default.accept_source_route"
/sbin/sysctl net.ipv4.conf.default.accept_source_route




echo "***CIS Ref: 7.2.2 Disable ICMP Redirect Acceptance (Scored)***"
echo "   Command: /sbin/sysctl net.ipv4.conf.all.accept_redirects "
/sbin/sysctl net.ipv4.conf.all.accept_redirects 
echo "   Command: /sbin/sysctl net.ipv4.conf.default.accept_redirects"
/sbin/sysctl net.ipv4.conf.default.accept_redirects




echo "***CIS Ref: 7.2.3 Disable Secure ICMP Redirect Acceptance (Scored)***"
echo "   Command: /sbin/sysctl net.ipv4.conf.all.secure_redirects "
/sbin/sysctl net.ipv4.conf.all.secure_redirects 
echo "   Command: /sbin/sysctl net.ipv4.conf.default.secure_redirects"
/sbin/sysctl net.ipv4.conf.default.secure_redirects




echo "***CIS Ref: 7.2.4 Log Suspicious Packets (Scored)***"
echo "   Command: /sbin/sysctl net.ipv4.conf.all.log_martians "
/sbin/sysctl net.ipv4.conf.all.log_martians 
echo "   Command: /sbin/sysctl net.ipv4.conf.default.log_martians"
/sbin/sysctl net.ipv4.conf.default.log_martians




echo "***CIS Ref: 7.2.5 Enable Ignore Broadcast Requests (Scored)***"
echo "   Command: /sbin/sysctl net.ipv4.icmp_echo_ignore_broadcasts"
/sbin/sysctl net.ipv4.icmp_echo_ignore_broadcasts




echo "***CIS Ref: 7.2.6 Enable Bad Error Message Protection (Scored)***"
echo "   Command: /sbin/sysctl net.ipv4.icmp_ignore_bogus_error_responses"
/sbin/sysctl net.ipv4.icmp_ignore_bogus_error_responses




echo "***CIS Ref: 7.2.7 Enable RFC-recommended Source Route Validation (Scored)***"
echo "   Command: /sbin/sysctl net.ipv4.conf.all.rp_filter "
/sbin/sysctl net.ipv4.conf.all.rp_filter 
echo "   Command: /sbin/sysctl net.ipv4.conf.default.rp_filter"
/sbin/sysctl net.ipv4.conf.default.rp_filter




echo "***CIS Ref: 7.2.8 Enable TCP SYN Cookies (Scored)***"
echo "   Command: /sbin/sysctl net.ipv4.tcp_syncookies"
/sbin/sysctl net.ipv4.tcp_syncookies




echo "***CIS Ref: 7.3 Configure IPv6***"




echo "***CIS Ref: 7.3.1 Disable IPv6 Router Advertisements (Not Scored)***"
echo "   Command: /sbin/sysctl net.ipv6.conf.all.accept_ra "
/sbin/sysctl net.ipv6.conf.all.accept_ra 
echo "   Command: /sbin/sysctl net.ipv6.conf.default.accept_ra"
/sbin/sysctl net.ipv6.conf.default.accept_ra




echo "***CIS Ref: 7.3.2 Disable IPv6 Redirect Acceptance (Not Scored)***"
echo "   Command: /sbin/sysctl net.ipv6.conf.all.accept_redirects "
/sbin/sysctl net.ipv6.conf.all.accept_redirects 
echo "   Command: /sbin/sysctl net.ipv6.conf.default.accept_redirects"
/sbin/sysctl net.ipv6.conf.default.accept_redirects




echo "***CIS Ref: 7.3.3 Disable IPv6 (Not Scored)***"
echo "   Command: ip addr | grep inet6"
ip addr | grep inet6




echo "***CIS Ref: 7.4 Install TCP Wrappers***"




echo "***CIS Ref: 7.4.1 Install TCP Wrappers (Scored)***"
echo "   Command: dpkg -s tcpd"
dpkg -s tcpd




echo "***CIS Ref: 7.4.2 Create /etc/hosts.allow (Not Scored)***"
echo "   Command: cat /etc/hosts.allow"
cat /etc/hosts.allow




echo "***CIS Ref: 7.4.3 Verify Permissions on /etc/hosts.allow (Scored)***"
echo "   Command: /bin/ls -l /etc/hosts.allow"
/bin/ls -l /etc/hosts.allow




echo "***CIS Ref: 7.4.4 Create /etc/hosts.deny (Not Scored)***"
echo "   Command: grep 'ALL: ALL' /etc/hosts.deny"
grep "ALL: ALL" /etc/hosts.deny




echo "***CIS Ref: 7.4.5 Verify Permissions on /etc/hosts.deny (Scored)***"
echo "   Command: /bin/ls -l /etc/hosts.deny"
/bin/ls -l /etc/hosts.deny




echo "***CIS Ref: 7.5 Uncommon Network Protocols***"




echo "***CIS Ref: 7.5.1 Disable DCCP (Not Scored)***"
echo "   Command: grep 'install dccp /bin/true' /etc/modprobe.d/CIS.conf"
grep "install dccp /bin/true" /etc/modprobe.d/CIS.conf




echo "***CIS Ref: 7.5.2 Disable SCTP (Not Scored)***"
echo "   Command: grep 'install sctp /bin/true' /etc/modprobe.d/CIS.conf"
grep "install sctp /bin/true" /etc/modprobe.d/CIS.conf




echo "***CIS Ref: 7.5.3 Disable RDS (Not Scored)***"
echo "   Command: grep 'install rds /bin/true' /etc/modprobe.d/CIS.conf"
grep "install rds /bin/true" /etc/modprobe.d/CIS.conf




echo "***CIS Ref: 7.5.4 Disable TIPC (Not Scored)***"
echo "   Command: grep 'install tipc /bin/true' /etc/modprobe.d/CIS.conf"
grep "install tipc /bin/true" /etc/modprobe.d/CIS.conf




echo "***CIS Ref: 7.6 Deactivate Wireless Interfaces (Not Scored)***"
echo "   Command: ifconfig -a"
ifconfig -a




echo "***CIS Ref: 7.7 Ensure Firewall is active (Scored)***"
echo "   Command: ufw status"
ufw status




echo "***CIS Ref: 8 Logging and Auditing***"




echo "***CIS Ref: 8.1 Configure System Accounting (auditd)***"




echo "***CIS Ref: 8.1.1 Configure Data Retention***"




echo "***CIS Ref: 8.1.1.1 Configure Audit Log Storage Size (L2 Not Scored)***"
echo "   Command: grep max_log_file /etc/audit/auditd.conf"
grep max_log_file /etc/audit/auditd.conf




echo "***CIS Ref: 8.1.1.2 Disable System on Audit Log Full (L2 Not Scored)***"
echo "   Command: grep space_left_action /etc/audit/auditd.conf "
grep space_left_action /etc/audit/auditd.conf 
echo "   Command: grep action_mail_acct /etc/audit/auditd.conf "
grep action_mail_acct /etc/audit/auditd.conf 
echo "   Command: grep admin_space_left_action /etc/audit/auditd.conf"
grep admin_space_left_action /etc/audit/auditd.conf




echo "***CIS Ref: 8.1.1.3 Keep All Auditing Information (L2 Scored)***"
echo "   Command: grep max_log_file_action /etc/audit/auditd.conf"
grep max_log_file_action /etc/audit/auditd.conf




echo "***CIS Ref: 8.1.2 Install and Enable auditd Service (L2 Scored)***"
echo "   Command: dpkg -s auditd"
dpkg -s auditd




echo "***CIS Ref: 8.1.3 Enable Auditing for Processes That Start Prior to auditd (L2 Scored)***"
echo "   Command: grep 'linux' /boot/grub/grub.cfg"
grep "linux" /boot/grub/grub.cfg




echo "***CIS Ref: 8.1.4 Record Events That Modify Date and Time Information (Scored)***"
echo "   Command: grep time-change /etc/audit/audit.rules"
grep time-change /etc/audit/audit.rules




echo "***CIS Ref: 8.1.5 Record Events That Modify User/Group Information (L2 Scored)***"
echo "   Command: grep identity /etc/audit/audit.rules"
grep identity /etc/audit/audit.rules




echo "***CIS Ref: 8.1.6 Record Events That Modify the System's Network Environment (L2 Scored)***"
echo "   Command: grep system-locale /etc/audit/audit.rules"
grep system-locale /etc/audit/audit.rules




echo "***CIS Ref: 8.1.7 Record Events That Modify the System's Mandatory Access Controls (L2 Scored)***"
echo "   Command: grep MAC-policy /etc/audit/audit.rules"
grep MAC-policy /etc/audit/audit.rules




echo "***CIS Ref: 8.1.8 Collect Login and Logout Events (L2 Scored)***"
echo "   Command: grep logins /etc/audit/audit.rules"
grep logins /etc/audit/audit.rules




echo "***CIS Ref: 8.1.9 Collect Session Initiation Information (L2 Scored)***"
echo "   Command: grep session /etc/audit/audit.rules"
grep session /etc/audit/audit.rules




echo "***CIS Ref: 8.1.10 Collect Discretionary Access Control Permission Modification Events (L2 Scored)***"
echo "   Command: grep perm_mod /etc/audit/audit.rules"
grep perm_mod /etc/audit/audit.rules




echo "***CIS Ref: 8.1.11 Collect Unsuccessful Unauthorized Access Attempts to Files (Scored)***"
echo "   Command: grep access /etc/audit/audit.rules"
grep access /etc/audit/audit.rules




echo "***CIS Ref: 8.1.12 Collect Use of Privileged Commands (L2 Scored)***"




echo "***CIS Ref: 8.1.13 Collect Successful File System Mounts (L2 Scored)***"
echo "   Command: grep mounts /etc/audit/audit.rules"
grep mounts /etc/audit/audit.rules




echo "***CIS Ref: 8.1.14 Collect File Deletion Events by User (L2 Scored)***"
echo "   Command: grep delete /etc/audit/audit.rules"
grep delete /etc/audit/audit.rules




echo "***CIS Ref: 8.1.15 Collect Changes to System Administration Scope (sudoers) (L2 Scored)***"




echo "***CIS Ref: 8.1.16 Collect System Administrator Actions (sudolog) (L2 Scored)***"
echo "   Command: grep actions /etc/audit/audit.rules"
grep actions /etc/audit/audit.rules




echo "***CIS Ref: 8.1.17 Collect Kernel Module Loading and Unloading (L2 Scored)***"
echo "   Command: grep modules /etc/audit/audit.rules"
grep modules /etc/audit/audit.rules




echo "***CIS Ref: 8.1.18 Make the Audit Configuration Immutable (L2 Scored)***"
echo "   Command: tail -n 1 /etc/audit/audit.rules"
tail -n 1 /etc/audit/audit.rules




echo "***CIS Ref: 8.2 Configure rsyslog***"




echo "***CIS Ref: 8.2.1 Install the rsyslog package (Scored)***"
echo "   Command: dpkg -s rsyslog"
dpkg -s rsyslog




echo "***CIS Ref: 8.2.2 Ensure the rsyslog Service is activated (Scored)***"
echo "   Command: initctl show-config rsyslog"
initctl show-config rsyslog




echo "***CIS Ref: 8.2.3 Configure /etc/rsyslog.conf (Not Scored)***"
echo "   Command: ls -l /var/log/"
ls -l /var/log/




echo "***CIS Ref: 8.2.4 Create and Set Permissions on rsyslog Log Files (Scored)***"
echo "   Command: # nanual ls -l <logfile>"
# nanual ls -l <logfile>




echo "***CIS Ref: 8.2.5 Configure rsyslog to Send Logs to a Remote Log Host (Scored)***"
echo "   Command: grep '^*.*[^I][^I]*@' /etc/rsyslog.conf"
grep "^*.*[^I][^I]*@" /etc/rsyslog.conf




echo "***CIS Ref: 8.2.6 Accept Remote rsyslog Messages Only on Designated Log Hosts (Not Scored)***"
echo "   Command: grep '$ModLoad imtcp.so' /etc/rsyslog.conf "
grep '$ModLoad imtcp.so' /etc/rsyslog.conf 
echo "   Command: grep '$InputTCPServerRun' /etc/rsyslog.conf"
grep '$InputTCPServerRun' /etc/rsyslog.conf




echo "***CIS Ref: 8.3 Advanced Intrusion Detection Environment (AIDE)***"




echo "***CIS Ref: 8.3.1 Install AIDE (L2 Scored)***"
echo "   Command: dpkg -s aide"
dpkg -s aide




echo "***CIS Ref: 8.3.2 Implement Periodic Execution of File Integrity (L2 Scored)***"
echo "   Command: crontab -u root -l | grep aide"
crontab -u root -l | grep aide




echo "***CIS Ref: 8.4 Configure logrotate (Not Scored)***"
echo "   Command: Manual"
Manual




echo "***CIS Ref: 9 System Access, Authentication and Authorization***"




echo "***CIS Ref: 9.1 Configure cron***"




echo "***CIS Ref: 9.1.1 Enable cron Daemon (Scored)***"
echo "   Command: /sbin/initctl show-config cron"
/sbin/initctl show-config cron




echo "***CIS Ref: 9.1.2 Set User/Group Owner and Permission on /etc/crontab (Scored)***"
echo "   Command: stat -c '%a %u %g' /etc/crontab | egrep ".00 0 0""
stat -c "%a %u %g" /etc/crontab | egrep ".00 0 0"




echo "***CIS Ref: 9.1.3 Set User/Group Owner and Permission on /etc/cron.hourly (Scored)***"
echo "   Command: stat -c '%a %u %g' /etc/cron.hourly | egrep ".00 0 0""
stat -c "%a %u %g" /etc/cron.hourly | egrep ".00 0 0"




echo "***CIS Ref: 9.1.4 Set User/Group Owner and Permission on /etc/cron.daily (Scored)***"
echo "   Command: stat -c '%a %u %g' /etc/cron.daily | egrep ".00 0 0""
stat -c "%a %u %g" /etc/cron.daily | egrep ".00 0 0"




echo "***CIS Ref: 9.1.5 Set User/Group Owner and Permission on /etc/cron.weekly (Scored)***"
echo "   Command: stat -c '%a %u %g' /etc/cron.weekly | egrep ".00 0 0""
stat -c "%a %u %g" /etc/cron.weekly | egrep ".00 0 0"




echo "***CIS Ref: 9.1.6 Set User/Group Owner and Permission on /etc/cron.monthly (Scored)***"
echo "   Command: stat -c '%a %u %g' /etc/cron.monthly | egrep ".00 0 0""
stat -c "%a %u %g" /etc/cron.monthly | egrep ".00 0 0"




echo "***CIS Ref: 9.1.7 Set User/Group Owner and Permission on /etc/cron.d (Scored)***"
echo "   Command: stat -c '%a %u %g' /etc/cron.d | egrep ".00 0 0""
stat -c "%a %u %g" /etc/cron.d | egrep ".00 0 0"




echo "***CIS Ref: 9.1.8 Restrict at/cron to Authorized Users (Scored)***"
echo "   Command: ls -l /etc/cron.deny "
ls -l /etc/cron.deny 
echo "   Command: ls -l /etc/at.deny"
ls -l /etc/at.deny




echo "***CIS Ref: 9.2 Configure PAM***"




echo "***CIS Ref: 9.2.1 Set Password Creation Requirement Parameters Using pam_cracklib (Scored)***"
echo "   Command: grep pam_cracklib.so /etc/pam.d/common-password"
grep pam_cracklib.so /etc/pam.d/common-password




echo "***CIS Ref: 9.2.2 Set Lockout for Failed Password Attempts (Not Scored)***"
echo "   Command: grep 'pam_tally2' /etc/pam.d/login"
grep "pam_tally2" /etc/pam.d/login




echo "***CIS Ref: 9.2.3 Limit Password Reuse (Scored)***"
echo "   Command: grep 'remember' /etc/pam.d/common-password"
grep "remember" /etc/pam.d/common-password




echo "***CIS Ref: 9.3 Configure SSH***"
echo "   Command: dpkg -s openssh-server"
dpkg -s openssh-server




echo "***CIS Ref: 9.3.1 Set SSH Protocol to 2 (Scored)***"
echo "   Command: grep '^Protocol' /etc/ssh/sshd_config"
grep "^Protocol" /etc/ssh/sshd_config




echo "***CIS Ref: 9.3.2 Set LogLevel to INFO (Scored)***"
echo "   Command: grep '^LogLevel' /etc/ssh/sshd_config"
grep "^LogLevel" /etc/ssh/sshd_config




echo "***CIS Ref: 9.3.3 Set Permissions on /etc/ssh/sshd_config (Scored)***"
echo "   Command: /bin/ls -l /etc/ssh/sshd_config"
/bin/ls -l /etc/ssh/sshd_config




echo "***CIS Ref: 9.3.4 Disable SSH X11 Forwarding (Scored)***"
echo "   Command: grep '^X11Forwarding' /etc/ssh/sshd_config"
grep "^X11Forwarding" /etc/ssh/sshd_config




echo "***CIS Ref: 9.3.5 Set SSH MaxAuthTries to 4 or Less (Scored)***"
echo "   Command: grep '^MaxAuthTries' /etc/ssh/sshd_config"
grep "^MaxAuthTries" /etc/ssh/sshd_config




echo "***CIS Ref: 9.3.6 Set SSH IgnoreRhosts to Yes (Scored)***"
echo "   Command: grep '^IgnoreRhosts' /etc/ssh/sshd_config"
grep "^IgnoreRhosts" /etc/ssh/sshd_config




echo "***CIS Ref: 9.3.7 Set SSH HostbasedAuthentication to No (Scored)***"
echo "   Command: grep '^HostbasedAuthentication' /etc/ssh/sshd_config"
grep "^HostbasedAuthentication" /etc/ssh/sshd_config




echo "***CIS Ref: 9.3.8 Disable SSH Root Login (Scored)***"
echo "   Command: grep '^PermitRootLogin' /etc/ssh/sshd_config"
grep "^PermitRootLogin" /etc/ssh/sshd_config




echo "***CIS Ref: 9.3.9 Set SSH PermitEmptyPasswords to No (Scored)***"
echo "   Command: grep '^PermitEmptyPasswords' /etc/ssh/sshd_config"
grep "^PermitEmptyPasswords" /etc/ssh/sshd_config




echo "***CIS Ref: 9.3.10 Do Not Allow Users to Set Environment Options (Scored)***"
echo "   Command: grep PermitUserEnvironment /etc/ssh/sshd_config"
grep PermitUserEnvironment /etc/ssh/sshd_config




echo "***CIS Ref: 9.3.11 Use Only Approved Cipher in Counter Mode (Scored)***"
echo "   Command: grep 'Ciphers' /etc/ssh/sshd_config"
grep "Ciphers" /etc/ssh/sshd_config




echo "***CIS Ref: 9.3.12 Set Idle Timeout Interval for User Login (Scored)***"
echo "   Command: grep '^ClientAliveInterval' /etc/ssh/sshd_config "
grep "^ClientAliveInterval" /etc/ssh/sshd_config 
echo "   Command: grep '^ClientAliveCountMax' /etc/ssh/sshd_config"
grep "^ClientAliveCountMax" /etc/ssh/sshd_config




echo "***CIS Ref: 9.3.13 Limit Access via SSH (Scored)***"
echo "   Command: grep '^AllowUsers' /etc/ssh/sshd_config"
grep "^AllowUsers" /etc/ssh/sshd_config
echo "   Command: grep '^AllowGroups' /etc/ssh/sshd_config "
grep "^AllowGroups" /etc/ssh/sshd_config 
echo "   Command: grep '^DenyUsers' /etc/ssh/sshd_config "
grep "^DenyUsers" /etc/ssh/sshd_config 
echo "   Command: grep '^DenyGroups' /etc/ssh/sshd_config"
grep "^DenyGroups" /etc/ssh/sshd_config




echo "***CIS Ref: 9.3.14 Set SSH Banner (Scored)***"
echo "   Command: grep '^Banner' /etc/ssh/sshd_config"
grep "^Banner" /etc/ssh/sshd_config




echo "***CIS Ref: 9.4 Restrict root Login to System Console (Not Scored)***"
echo "   Command: cat /etc/securetty"
cat /etc/securetty




echo "***CIS Ref: 9.5 Restrict Access to the su Command (Scored)***"
echo "   Command: grep pam_wheel.so /etc/pam.d/su"
grep pam_wheel.so /etc/pam.d/su
echo "   Command: grep wheel /etc/group"
grep wheel /etc/group




echo "***CIS Ref: 10 User Accounts and Environment***"




echo "***CIS Ref: 10.1 Set Shadow Password Suite Parameters (/etc/login.defs)***"




echo "***CIS Ref: 10.1.1 Set Password Expiration Days (Scored)***"
echo "   Command: grep PASS_MAX_DAYS /etc/login.defs "
grep PASS_MAX_DAYS /etc/login.defs 
echo "   Command: chage --list <user>"
# manual exec required
# chage --list <user>




echo "***CIS Ref: 10.1.2 Set Password Change Minimum Number of Days (Scored)***"
echo "   Command: grep PASS_MIN_DAYS /etc/login.defs"
grep PASS_MIN_DAYS /etc/login.defs
echo "   Command: chage --list <user>"
# manual exec required
# chage --list <user>




echo "***CIS Ref: 10.1.3 Set Password Expiring Warning Days (Scored)***"
echo "   Command: grep PASS_WARN_AGE /etc/login.defs"
grep PASS_WARN_AGE /etc/login.defs
echo "   Command: chage --list <user>"
# manual exec required
# chage --list <user>




echo "***CIS Ref: 10.2 Disable System Accounts (Scored)***"
echo "   Command: [Escaped]"
egrep -v "^\+" /etc/passwd | awk -F: '($1!="root" && $1!="sync" && $1!="shutdown" && $1!="halt" && $3<500 && $7!="/usr/sbin/nologin" && $7!="/bin/false") {print}'




echo "***CIS Ref: 10.3 Set Default Group for root Account (Scored)***"
echo "   Command: grep '^root:' /etc/passwd | cut -f4 -d:"
grep "^root:" /etc/passwd | cut -f4 -d:




echo "***CIS Ref: 10.4 Set Default umask for Users (Scored)***"
echo "   Command: grep '^UMASK' /etc/login.defs"
grep "^UMASK" /etc/login.defs




echo "***CIS Ref: 10.5 Lock Inactive User Accounts (Scored)***"
echo "   Command: useradd -D | grep INACTIVE"
useradd -D | grep INACTIVE




echo "***CIS Ref: 11 Warning Banners***"




echo "***CIS Ref: 11.1 Set Warning Banner for Standard Login Services (Scored)***"
echo "   Command: /bin/ls -l /etc/motd"
/bin/ls -l /etc/motd
echo "   Command: /bin/ls /etc/issue "
/bin/ls /etc/issue 
echo "   Command: /bin/ls /etc/issue.net"
/bin/ls /etc/issue.net




echo "***CIS Ref: 11.2 Remove OS Information from Login Warning Banners (Scored)***"
echo "   Command: egrep '(\\v|\\r|\\m|\\s)' /etc/issue"
egrep '(\\v|\\r|\\m|\\s)' /etc/issue
echo "   Command: egrep '(\\v|\\r|\\m|\\s)' /etc/motd"
egrep '(\\v|\\r|\\m|\\s)' /etc/motd
echo "   Command: egrep '(\\v|\\r|\\m|\\s)' /etc/issue.net"
egrep '(\\v|\\r|\\m|\\s)' /etc/issue.net




echo "***CIS Ref: 11.3 Set Graphical Warning Banner (Not Scored)***"
echo "   Command: manual"
manual




echo "***CIS Ref: 12 Verify System File Permissions***"




echo "***CIS Ref: 12.1 Verify Permissions on /etc/passwd (Scored)***"
echo "   Command: /bin/ls -l /etc/passwd"
/bin/ls -l /etc/passwd




echo "***CIS Ref: 12.2 Verify Permissions on /etc/shadow (Scored)***"
echo "   Command: /bin/ls -l /etc/shadow"
/bin/ls -l /etc/shadow




echo "***CIS Ref: 12.3 Verify Permissions on /etc/group (Scored)***"
echo "   Command: /bin/ls -l /etc/group"
/bin/ls -l /etc/group




echo "***CIS Ref: 12.4 Verify User/Group Ownership on /etc/passwd (Scored)***"
echo "   Command: /bin/ls -l /etc/passwd"
/bin/ls -l /etc/passwd




echo "***CIS Ref: 12.5 Verify User/Group Ownership on /etc/shadow (Scored)***"
echo "   Command: /bin/ls -l /etc/shadow"
/bin/ls -l /etc/shadow




echo "***CIS Ref: 12.6 Verify User/Group Ownership on /etc/group (Scored)***"
echo "   Command: /bin/ls -l /etc/group"
/bin/ls -l /etc/group




echo "***CIS Ref: 12.7 Find World Writable Files (Not Scored)***"
echo "   Command: df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -type f -perm -0002 -print"
df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -type f -perm -0002 -print




echo "***CIS Ref: 12.8 Find Un-owned Files and Directories (Scored)***"
echo "   Command: df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -nouser -ls"
df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -nouser -ls




echo "***CIS Ref: 12.9 Find Un-grouped Files and Directories (Scored)***"
echo "   Command: df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -nogroup -ls"
df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -nogroup -ls




echo "***CIS Ref: 12.10 Find SUID System Executables (Not Scored)***"
echo "   Command: df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -type f -perm -4000 -print"
df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -type f -perm -4000 -print




echo "***CIS Ref: 12.11 Find SGID System Executables (Not Scored)***"
echo "   Command: df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -type f -perm -2000 -print"
df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -type f -perm -2000 -print




echo "***CIS Ref: 13 Review User and Group Settings***"
echo "   Command: [ESCAPED]"
/bin/cat /etc/shadow | /usr/bin/awk -F: '($2 == "" ) { print $1 " does not have a password "}'




echo "***CIS Ref: 13.2 Verify No Legacy + Entries Exist in /etc/passwd File (Scored)***"
echo "   Command: /bin/grep '^+:' /etc/passwd"
/bin/grep '^+:' /etc/passwd




echo "***CIS Ref: 13.3 Verify No Legacy + Entries Exist in /etc/shadow File (Scored)***"
echo "   Command: /bin/grep '^+:' /etc/shadow"
/bin/grep '^+:' /etc/shadow




echo "***CIS Ref: 13.4 Verify No Legacy + Entries Exist in /etc/group File (Scored)***"
echo "   Command: /bin/grep '^+:' /etc/group"
/bin/grep '^+:' /etc/group




echo "***CIS Ref: 13.5 Verify No UID 0 Accounts Exist Other Than root (Scored)***"
echo "   Command: /bin/cat /etc/passwd | /usr/bin/awk -F: '($3 == 0) { print $1 }' root"
/bin/cat /etc/passwd | /usr/bin/awk -F: '($3 == 0) { print $1 }' root


echo "***CIS Ref: 13.6 Ensure root PATH Integrity (Scored)***"
echo "   Command: [SCRIPT]"
if [ "`echo $PATH | grep :: `" != "" ]; then 
  echo "Empty Directory in PATH (::)" 
fi 
if [ "`echo $PATH | bin/grep :$`" != "" ]; then 
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



echo "***CIS Ref: 13.7 Check Permissions on User Home Directories (Scored)***"
echo "   Command: [SCRIPT]"
for dir in `/bin/cat /etc/passwd | /bin/egrep -v '(root|halt|sync|shutdown)' | /usr/bin/awk -F: '($7 != "/usr/sbin/nologin") { print $6 }'`; do 
  if [ -d $dir ]; then 
    dirperm=`/bin/ls -ld $dir | /usr/bin/cut -f1 -d" "` 
 if [ `echo $dirperm | /usr/bin/cut -c6 ` != "-" ]; then 
   echo "Group Write permission set on directory $dir" 
 fi
 if [ `echo $dirperm | /usr/bin/cut -c8 ` != "-" ]; then 
   echo "Other Read permission set on directory $dir" 
 fi
 if [ `echo $dirperm | /usr/bin/cut -c9 ` != "-" ]; then 
   echo "Other Write permission set on directory $dir" 
    fi
 if [ `echo $dirperm | /usr/bin/cut -c10 ` != "-" ]; then 
   echo "Other Execute permission set on directory $dir" 
 fi 
  fi
done




echo "***CIS Ref: 13.8 Check User Dot File Permissions (Scored)***"
echo "   Command: [SCRIPT]"
for dir in `/bin/cat /etc/passwd | /bin/egrep -v '(root|sync|halt|shutdown)' | /usr/bin/awk -F: '($7 != "/usr/sbin/nologin") { print $6 }'`; do 
  for file in $dir/.[A-Za-z0-9]*; do 
    if [ ! -h "$file" -a -f "$file" ]; then 
   fileperm=`/bin/ls -ld $file | /usr/bin/cut -f1 -d" "` 
   if [ `echo $fileperm | /usr/bin/cut -c6 ` != "-" ]; then 
     echo "Group Write permission set on file $file" 
   fi 
   if [ `echo $fileperm | /usr/bin/cut -c9 ` != "-" ]; then 
     echo "Other Write permission set on file $file" 
   fi 
 fi 
  done 
done




echo "***CIS Ref: 13.9 Check Permissions on User .netrc Files (Scored)***"
echo "   Command: [SCRIPT]"
for dir in `/bin/cat /etc/passwd | /bin/egrep -v '(root|sync|halt|shutdown)' | /usr/bin/awk -F: '($7 != "/usr/sbin/nologin") { print $6 }'`; do 
  for file in $dir/.netrc; do 
    if [ ! -h "$file" -a -f "$file" ]; then 
      fileperm=`/bin/ls -ld $file | /usr/bin/cut -f1 -d" "` 
      if [ `echo $fileperm | /usr/bin/cut -c5 ` != "-" ]; then 
        echo "Group Read set on $file" 
      fi 
      if [ `echo $fileperm | /usr/bin/cut -c6 ` != "-" ]; then 
        echo "Group Write set on $file" 
      fi 
      if [ `echo $fileperm | /usr/bin/cut -c7 ` != "-" ]; then 
        echo "Group Execute set on $file" 
      fi 
      if [ `echo $fileperm | /usr/bin/cut -c8 ` != "-" ]; then 
        echo "Other Read set on $file" 
      fi 
      if [ `echo $fileperm | /usr/bin/cut -c9 ` != "-" ]; then 
        echo "Other Write set on $file" 
      fi 
      if [ `echo $fileperm | /usr/bin/cut -c10 ` != "-" ]; then 
        echo "Other Execute set on $file" 
      fi 
    fi 
  done
done




echo "***CIS Ref: 13.10 Check for Presence of User .rhosts Files (Scored)***"
echo "   Command: [SCRIPT]"
for dir in `/bin/cat /etc/passwd | /bin/egrep -v '(root|halt|sync|shutdown)' | /usr/bin/awk -F: '($7 != "/usr/sbin/nologin") { print $6 }'`; do 
  for file in $dir/.rhosts; do 
    if [ ! -h "$file" -a -f "$file" ]; then 
   echo ".rhosts file in $dir" 
 fi
  done
done




echo "***CIS Ref: 13.11 Check Groups in /etc/passwd (Scored)***"
echo "   Command: [SCRIPT]"
for i in $(cut -s -d: -f4 /etc/passwd | sort -u ); do 
  grep -q -P "^.*?:[^:]*:$i:" /etc/group 
  if [ $? -ne 0 ]; then 
    echo "Group $i is referenced by /etc/passwd but does not exist in /etc/group" 
  fi 
done




echo "***CIS Ref: 13.12 Check That Users Are Assigned Valid Home Directories (Scored)***"
echo "   Command: [SCRIPT]"
cat /etc/passwd | awk -F: '{ print $1 " " $3 " " $6 }' | while read user uid dir; do 
  if [ $uid -ge 500 -a ! -d "$dir" -a $user != "nfsnobody" -a $user != "nobody" ]; then 
    echo "The home directory ($dir) of user $user does not exist." 
  fi 
done




echo "***CIS Ref: 13.13 Check User Home Directory Ownership (Scored)***"
echo "   Command: [SCRIPT]"
cat /etc/passwd | awk -F: '{ print $1 " " $3 " " $6 }' | while read user uid dir; do 
  if [ $uid -ge 500 -a -d "$dir" -a $user != "nfsnobody" ]; then 
    owner=$(stat -L -c "%U" "$dir") 
 if [ "$owner" != "$user" ]; then 
   echo "The home directory ($dir) of user $user is owned by $owner." 
 fi 
  fi
done




echo "***CIS Ref: 13.14 Check for Duplicate UIDs (Scored)***"
echo "   Command: [SCRIPT]"
/bin/cat /etc/passwd | /usr/bin/cut -f3 -d":" | /usr/bin/sort -n | /usr/bin/uniq -c | while read x ; do 
  [ -z "${x}" ] && break set - $x 
  if [ $1 -gt 1 ]; then 
    users=`/usr/bin/awk -F: '($3 == n) { print $1 }' n=$2 /etc/passwd | /usr/bin/xargs` 
 echo "Duplicate UID ($2): ${users}" 
  fi
done




echo "***CIS Ref: 13.15 Check for Duplicate GIDs (Scored)***"
echo "   Command: [SCRIPT]"
/bin/cat /etc/group | /usr/bin/cut -f3 -d":" | /usr/bin/sort -n | /usr/bin/uniq -c |  while read x ; do
    [ -z "${x}" ] && break 
 set - $x 
 if [ $1 -gt 1 ]; then grps=`/usr/bin/awk -F: '($3 == n) { print $1 }' n=$2  /etc/group | xargs` 
   echo "Duplicate GID ($2): ${grps}" 
 fi
  done




echo "***CIS Ref: 13.16 Check for Duplicate User Names (Scored)***"
echo "   Command: [SCRIPT]"
cat /etc/passwd | /usr/bin/cut -f1 -d":" | /usr/bin/sort -n | /usr/bin/uniq -c | while read x ; do 
    [ -z "${x}" ] && break 
    set - $x 
 if [ $1 -gt 1 ]; then 
 uids=`/usr/bin/awk -F: '($1 == n) { print $3 }' n=$2  /etc/passwd | xargs` 
   echo "Duplicate User Name ($2): ${uids}" 
 fi 
done




echo "***CIS Ref: 13.17 Check for Duplicate Group Names (Scored)***"
echo "   Command: [SCRIPT]"
cat /etc/group | /usr/bin/cut -f1 -d":" | /usr/bin/sort -n | /usr/bin/uniq -c | while read x ; do 
  [ -z "${x}" ] && break 
  set - $x 
  if [ $1 -gt 1 ]; then 
    gids=`/usr/bin/awk -F: '($1 == n) { print $3 }' n=$2 /etc/group | xargs` 
 echo "Duplicate Group Name ($2): ${gids}" 
  fi
done




echo "***CIS Ref: 13.18 Check for Presence of User .netrc Files (Scored)***"
echo "   Command: [SCRIPT]"
for dir in `/bin/cat /etc/passwd |  /usr/bin/awk -F: '{ print $6 }'`; do 
  if [ ! -h "$dir/.netrc" -a -f "$dir/.netrc" ]; then 
    echo ".netrc file $dir/.netrc exists" 
  fi 
done




echo "***CIS Ref: 13.19 Check for Presence of User .forward Files (Scored)***"
echo "   Command: [SCRIPT]"
for dir in `/bin/cat /etc/passwd | /usr/bin/awk -F: '{ print $6 }'`; do 
  if [ ! -h "$dir/.forward" -a -f "$dir/.forward" ]; then 
    echo ".forward file $dir/.forward exists" 
  fi
done




echo "***CIS Ref: 13.20 Ensure shadow group is empty (Scored)***"
echo "   Command: grep ^shadow /etc/group"
grep ^shadow /etc/group
echo "   COMMAND: [SCRIPT]"
#manual
# awk -F: '($4 == "<shadow-gid>") { print }' /etc/passwd




