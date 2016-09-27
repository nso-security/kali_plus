echo ===============enum System Profile Results===============> enum.txt
echo ~~~~~~~~~~~~~~~~~~~~hostname~~~~~~~~~~~~~~~~~~~~ >>enum.txt
echo ===============enum System Profile Results===============> enum.txt
echo ####################Basic Information#################### >> enum.txt
hostname >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~history ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
history >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~uname -a $(date)~~~~~~~~~~~~~~~~~~~~ >>enum.txt
uname -a >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~uname -r~~~~~~~~~~~~~~~~~~~~ >>enum.txt
uname -r >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~uname -n~~~~~~~~~~~~~~~~~~~~ >>enum.txt
uname -n >>enum.txt

echo ~~~~~~~~~~~~~~~~~~~~uname -m~~~~~~~~~~~~~~~~~~~~ >>enum.txt
uname -m >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~cat /proc/version~~~~~~~~~~~~~~~~~~~~ >>enum.txt
cat /proc/version >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~cat /etc/*-release ~~~~~~~~~~~~~~~~~~~~~ >>enum.txt
cat /etc/*-release >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~cat /etc/issue ~~~~~~~~~~~~~~~~~~~ >>enum.txt
cat /etc/issue >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~cat /proc/cpuinfo ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
cat /proc/cpuinfo >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~df -a~~~~~~~~~~~~~~~~~~~~ >>enum.txt
df -a >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~memory~~~~~~~~~~~~~~~~~~~~ >>enum.txt
free -m >>enum.txt




echo ####################Users and Groups####################>> enum.txt
echo ~~~~~~~~~~~~~~~~~~~~ /etc/passwd $(date)~~~~~~~~~~~~~~~~~~~~ >>enum.txt
cat /etc/passwd >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~ /etc/group ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
cat /etc/group >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~List all uid’s and respective group memberships ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
for i in $(cat /etc/passwd 2>/dev/null| cut -d":" -f1 2>/dev/null);do id $i;done 2>/dev/null  >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~List all super user accounts ~~~~~~~~~~~~~~~~~~~~ >>enum.txt  >>enum.txt
grep -v -E "^#" /etc/passwd | awk -F: '$3 == 0 { print $1}' >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~finger ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
finger >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~pinky ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
pinky  >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~users ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
users  >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~who -a ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
who -a  >>enum.txt 
echo ~~~~~~~~~~~~~~~~~~~~Who is currently logged in and what they’re doing ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
w  >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~last ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
last  >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~Information on when all users last logged in ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
lastlog  >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~Information on when the specified user last logged in ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
#lastlog –u %username%  >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~ lastlog |grep -v "Never" ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
lastlog |grep -v "Never"  >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~Can the current user run any ‘interesting’ binaries as root ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
sudo -l 2>/dev/null | grep -w 'nmap\|perl\|'awk'\|'find'\|'bash'\|'sh'\|'man'\|'more'\|'less'\|'vi'\|'vim'\|'nc'\|'netcat'\|python\|ruby\|lua\|irb' | xargs -r ls -la 2>/dev/null  >>enum.txt

echo ####################Environment####################>> enum.txt
echo ~~~~~~~~~~~~~~~~~~~~env $(date)~~~~~~~~~~~~~~~~~~~~ >>enum.txt
env >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~set ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
set >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~PATH ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
echo $PATH >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~pwd ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
pwd >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~/etc/profile ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
cat /etc/profile >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~/etc/shells ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
cat /etc/shells >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~ ~~~~~~~~~~~~~~~~~~~~ >>enum.txt



echo ####################Interesting Files####################>> enum.txt
echo ~~~~~~~~~~~~~~~~~~~~Find SUID files $(date)~~~~~~~~~~~~~~~~~~~~ >>enum.txt
find / -perm -4000 -type f 2>/dev/null >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~Find SUID files owned by root $(date)~~~~~~~~~~~~~~~~~~~~ >>enum.txt
find / -uid 0 -perm -4000 -type f 2>/dev/null >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~Find GUID files $(date)~~~~~~~~~~~~~~~~~~~~ >>enum.txt
find / -perm -2000 -type f 2>/dev/null >>enum.txt
#echo ~~~~~~~~~~~~~~~~~~~~ Find world-writeable files $(date)~~~~~~~~~~~~~~~~~~~~ >>enum.txt
#find / -perm -2 -type f 2>/dev/null >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~Find world-writeable files excluding those in /proc $(date)~~~~~~~~~~~~~~~~~~~~ >>enum.txt
find / ! -path "*/proc/*" -perm -2 -type f -print 2>/dev/null >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~Find word-writeable directories $(date)~~~~~~~~~~~~~~~~~~~~ >>enum.txt
find / -perm -2 -type d 2>/dev/null >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~Find rhost config files $(date)~~~~~~~~~~~~~~~~~~~~ >>enum.txt
#find /home -name *.rhosts -print 2>/dev/null >>enum.txt
find /home -name "*.rhost" 2>/dev/null >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~Find *.plan files, list permissions and cat the file contents $(date)~~~~~~~~~~~~~~~~~~~~ >>enum.txt
find /home -iname *.plan -exec ls -la {} \; -exec cat {} 2>/dev/null \; >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~Find hosts.equiv, list permissions and cat the file contents $(date)~~~~~~~~~~~~~~~~~~~~ >>enum.txt
find /etc -iname hosts.equiv -exec ls -la {} 2>/dev/null \; -exec cat {} 2>/dev/null \; >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~See if you can access other user directories to find interesting files ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
ls -ahlR /root/ >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~Show the current users’ various history files ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
ls -la ~/.*_history >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~ Can we read root’s history files $(date)~~~~~~~~~~~~~~~~~~~~ >>enum.txt
ls -la /root/.*_history >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~Check for interesting ssh files in the current users’ directory ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
ls -la ~/.ssh/ >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~ Find SSH keys/host information~~~~~~~~~~~~~~~~~~~~ >>enum.txt
find / -name "id_dsa*" -o -name "id_rsa*" -o -name "known_hosts" -o -name "authorized_hosts" -o -name "authorized_keys" 2>/dev/null |xargs -r ls -la  >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~ Check Configuration of inetd services~~~~~~~~~~~~~~~~~~~~ >>enum.txt
ls -la /usr/sbin/in.* >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~Check log files for keywords  and show positive matches $(date)~~~~~~~~~~~~~~~~~~~~ >>enum.txt
grep  -i pass /var/log/*.log 2>/dev/null >>enum.txt
grep  -i password /var/log/*.log 2>/dev/null >>enum.txt
grep  -i passwd /var/log/*.log 2>/dev/null >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~List files in specified directory /var/log $(date)~~~~~~~~~~~~~~~~~~~~ >>enum.txt
#find /var/log -type f -exec ls -la {} \; 2>/dev/null  >>enum.txt
ls /var/log/*.log  >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~List .log files in specified directory /var/log ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
find /var/log -name "*.log" -type f -exec ls -la {} \; 2>/dev/null  >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~List .conf files in /etc recursive 1 level $(date)~~~~~~~~~~~~~~~~~~~~ >>enum.txt
find /etc/ -maxdepth 1 -name "*.conf" -type f -exec ls -la {} \; 2>/dev/null  >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~ List .conf files in /etc recursive 1 level~~~~~~~~~~~~~~~~~~~~ >>enum.txt
ls -la /etc/*.conf  >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~Find .conf files recursive 4 levels and output line number where the word ‘password’ is located ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
find / -maxdepth 4 -name *.conf -type f -exec grep -Hn password {} \; 2>/dev/null >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~ List open files output will depend on account privileges $(date)~~~~~~~~~~~~~~~~~~~~ >>enum.txt
lsof -i -n >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~Can we read roots mail $(date)~~~~~~~~~~~~~~~~~~~~ >>enum.txt
head /var/mail/root >>enum.txt

echo ####################Services####################>> enum.txt
echo ~~~~~~~~~~~~~~~~~~~~ all services $(date)~~~~~~~~~~~~~~~~~~~~ >>enum.txt
ps aux   >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~View services running as root ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
ps aux | grep root  >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~Lookup process binary path and permissions ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
ps aux | awk '{print $11}'|xargs -r ls -la 2>/dev/null |awk '!x[$0]++' >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~ ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
cat /etc/inetd.conf >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~List services managed by inetd ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
cat /etc/xinetd.conf >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~As above for xinetd ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
cat /etc/xinetd.conf 2>/dev/null | awk '{print $7}' |xargs -r ls -la 2>/dev/null >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~extract associated binaries from xinetd.conf and show permissions of each ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
ls -la /etc/exports 2>/dev/null; cat /etc/exports 2>/dev/null >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~Permissions and contents of /etc/exports NFS ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
ls -la /etc/exports 2>/dev/null; cat /etc/exports 2>/dev/null >>enum.txt


echo ####################Scheduled Jobs####################>> enum.txt

echo ~~~~~~~~~~~~~~~~~~~~scheduled jobs overview $(date)~~~~~~~~~~~~~~~~~~~~ >>enum.txt
ls -la /etc/cron*  >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~What can ‘others’ write in /etc/cron* directories ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
ls -aRl /etc/cron* | awk '$1 ~ /w.$/' 2>/dev/null  >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~List of current tasks ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
top -b -n1 >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~ ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
echo ####################Networking, Routing & Communications####################>> enum.txt
echo ~~~~~~~~~~~~~~~~~~~~List all network interfaces $(date)~~~~~~~~~~~~~~~~~~~~ >>enum.txt
/sbin/ifconfig -a >> enum.txt
echo ~~~~~~~~~~~~~~~~~~~~List all network interfaces ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
cat /etc/network/interfaces >> enum.txt
echo ~~~~~~~~~~~~~~~~~~~~Display ARP communications ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
arp -a >> enum.txt
echo ~~~~~~~~~~~~~~~~~~~~Display route information ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
route >> enum.txt
echo ~~~~~~~~~~~~~~~~~~~~Show configured DNS sever addresses ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
cat /etc/resolv.conf >> enum.txt
echo ~~~~~~~~~~~~~~~~~~~~List all TCP sockets and related PIDs (-p Privileged command) ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
netstat -antp >> enum.txt
echo ~~~~~~~~~~~~~~~~~~~~List all UDP sockets and related PIDs (-p Privileged command) ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
netstat -anup >> enum.txt
echo ~~~~~~~~~~~~~~~~~~~~List rules – Privileged command ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
iptables -L >> enum.txt
echo ~~~~~~~~~~~~~~~~~~~~View port numbers/services mappingsView port numbers/services mappings ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
#cat /etc/services >> enum.txt
echo ~~~~~~~~~~~~~~~~~~~~ ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
echo #################### Programs Installed####################>> enum.txt
echo ~~~~~~~~~~~~~~~~~~~~Installed packages Debian ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
dpkg -l >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~Installed packages Red Hat ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
rpm -qa  >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~last redhat patch ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
rpm -qa --queryformat '%{installtime} (%{installtime:date}) %{name}\n' | sort -n   >> enum.txt
echo ~~~~~~~~~~~~~~~~~~~~Sudo version – does an exploit exist? $(date)~~~~~~~~~~~~~~~~~~~~ >>enum.txt
sudo -V  >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~Apache version ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
httpd -v >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~Apache version ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
apache2 -v >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~List loaded Apache modules ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
apache2ctl -M  >>enum.txt
apachectl -M  >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~Installed MYSQL version details ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
mysql --version  >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~Installed Postgres version details ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
psql -V  >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~Installed Perl version details ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
perl -v  >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~Installed Java version details ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
java -version  >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~Installed Python version details ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
python --version  >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~ Installed Ruby version details ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
ruby -v  >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~Locate ‘useful’ programs (netcat, wget etc) $(date)~~~~~~~~~~~~~~~~~~~~ >>enum.txt
#find / -name %program_name% 2>/dev/null (i.e. nc, netcat, wget, nmap etc)
echo ~~~~~~~~~~~~~~~~~~~~ ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
#which %program_name% (i.e. nc, netcat, wget, nmap etc)
echo ~~~~~~~~~~~~~~~~~~~~List available compilers ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
dpkg --list 2>/dev/null| grep compiler |grep -v decompiler 2>/dev/null && yum list installed 'gcc*' 2>/dev/null| grep gcc 2>/dev/null  >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~Which account is Apache running as ~~~~~~~~~~~~~~~~~~~~ >>enum.txt
cat /etc/apache2/envvars 2>/dev/null |grep -i 'user\|group' |awk '{sub(/.*\export /,"")}1' >>enum.txt
echo ~~~~~~~~~~~~~~~~~~~~ ~~~~~~~~~~~~~~~~~~~~ >>enum.txt

#Additional Resource: http://www.rebootuser.com/?p=1623


