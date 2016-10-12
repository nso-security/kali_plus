#!/usr/bin/perl

use strict;

my ($fh, $outfile, $targetFile);

#install custom apps
system("apt-get install -y lxde shutter synapse fdpowermon audacity ");
#system("echo 'deb http://archive.getdeb.net/ubuntu xenial-getdeb apps' >> /etc/apt/sources.list.d/getdeb.list");
#system("wget -q -O- http://archive.getdeb.net/getdeb-archive.key | apt-key add -");
#system("apt update && sudo apt install avidemux2.6-qt");
#system("apt-get install -y avidemux2.6-gtk");

#Set LXDE as the default desktop
print "Choose LX\n";
system("update-alternatives --config x-session-manager");
system ("mkdir -p ~/.config/autostart/");

#start shutter on startup
$outfile = "/root/.config/autostart/shutter.desktop";
open ($fh, "> $outfile") or die $!;
print $fh <<EOF;
[Desktop Entry]
Type=Application
Exec=/usr/bin/shutter --min_at_startup
EOF
close($fh);

#start the battery monitor on load
$outfile = "/root/.config/autostart/fdpowermon.desktop";
open ($fh, "> $outfile") or die $!;
print $fh <<EOF;
[Desktop Entry]
Type=Application
Exec=/usr/bin/fdpowermon
EOF
close($fh);

#setup slock
$targetFile="slock-1.3.tar.gz";
system("apt-get install -y libxrandr-dev xautolock");
system("wget --directory-prefix /opt  http://dl.suckless.org/tools/slock-1.3.tar.gz");
system("tar -xzvf /opt/$targetFile -C /opt/");
system("rm -f /opt/$targetFile ");
system("cd /opt/slock-1.3 && make && make clean && make clean install ");


$outfile = "/root/.config/autostart/slock.desktop";
open ($fh, "> $outfile") or die $!;
print $fh <<EOF;
[Desktop Entry]
Type=Application
Exec=/usr/bin/xautolock -time 5 -locker slock
EOF
close($fh);

