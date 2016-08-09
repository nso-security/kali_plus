#if blocked run "get-ExecutionPolicy" take a note and then change to "set-executionpolicy unrestricted"
$outFile = get-content env:computername 
$outFile = $outfile +"-CIS-IIS_Benchmark.txt"
Set-PSDebug -trace 0


function showAndRun($cmd){
  echo "***Command: $cmd";  
  Invoke-Expression -Command "$cmd"
}

function printTestSeparator($testName){
  echo "`n`n-----------------------------------`n`n"
  echo "$testname`n"
}

Start-Transcript -path $outFile -append -IncludeInvocationHeader
$cmd = "dir"
showAndRun($cmd)


echo "===============System Profile Results==============="
echo "####################Section 1####################"
printTestSeparator "#1.1.1 (Level 1 Scored) Web content on non system partition "
$cmd="$env:SystemRoot\system32\inetsrv\appcmd list vdir "
showAndRun($cmd)


printTestSeparator "#1.1.2 (Level 1 Scored) Host Headers on all sites" 
$cmd="$env:SystemRoot\system32\inetsrv\appcmd list sites"
showAndRun($cmd)
printCheckPointSeparator

printTestSeparator "#1.1.3 (Level 1 Scored) Directory Browsing "
$cmd="$env:SystemRoot\system32\inetsrv\appcmd list config /section:directoryBrowse "
showAndRun($cmd)
printCheckPointSeparator

printTestSeparator "#1.1.4 (Level 1 Scored) App pool identity "
$cmd="$env:SystemRoot\system32\inetsrv\appcmd list app"

printTestSeparator "#1.1.5 (Level 1 Scored) Unique App pools "
echo "#same as 1.1.4"

printTestSeparator "#1.1.6 (Level 1 Scored) "
echo "#Manual review ApplicationHost.config for username attribute of anonymousAuthentication tag"
echo "#Probably located here: C:\Windows\System32\inetsrv\config"

printTestSeparator "#1.2.1 (Level 1 not scored) Global authorization rule"
echo "#manual review of web.config "
echo "#Probably located in c:\inetpub\ "

printTestSeparator "#1.2.2 (Level 1 not scored) Restricted Feature Access" 
echo "#manual review of web.config "
echo "#Probably located in c:\inetpub\ "

printTestSeparator "#1.2.3 (Level 1 scored) SSL in forms auth "
echo "#manual review of web.config "
echo "#Probably located in c:\inetpub\ "

printTestSeparator "#1.2.4 (Level 2 Scored) Forms auth for cookies "

printTestSeparator "#1.2.5 (Level 1 Scored) Cookie protection for forms auth "
echo "#manual review of web.config "
echo "#Probably located in c:\inetpub\ "

printTestSeparator "#1.2.6 (Level 2 Scored) Encryption providers "
$cmd="reg query HKLM\SOFTWARE\Microsoft\CRYPTOGRAPHY "
showAndRun($cmd)
echo "#this will give you the guid to put in the next command "
echo "icacls %ALLUSERSPROFILE%\Microsoft\Crypto\RSA\MachineKeys\76944fb33636aeddb9590521c2e8815a_<GUID>"

printTestSeparator "#1.2.7 (Level 1 not scored) SSL for basic auth "

printTestSeparator "#1.2.8 (Level 1 scored) credentials not in clear text "
echo "#machine.config, root level or app level web.config "

printTestSeparator "#1.2.9 (Level 2 scored)Credentials not in files "

printTestSeparator "#1.3.1 (Level 1 scored) Deployment Method to retail "
echo "#machine.config should be in %windir\Microsoft.NET\Framework\Version\Config "

printTestSeparator "#1.3.2 (Level 1 scored) Turn Debug Off "
echo "#manual review of web.config "

printTestSeparator "#1.3.3 (Level 2 Scored) Custom Error Message On "

printTestSeparator "#1.3.4 (Level 2 Scored).Net Stack tracing "
echo "#manual review of web.config "

printTestSeparator "#1.3.5 (Level 2 Scored) Cookies mode for session state "
echo "#manual  review web.config "

printTestSeparator "#1.3.6 (Level 2 Scored) Cookies with HTTP Only "
echo "#manual review of web.config "

printTestSeparator "#1.3.7 (Level 1 Scored) Machinekey validation .net 3.5 "
echo "#GUI validation "

printTestSeparator "echo #1.3.8 (Level 1 Scored) Machine key Validation Method .net 4.5 "
echo "echo #GUI validation "

printTestSeparator "#1.3.9 (Level 1 not scored) Configure Global- net Trust Level "
echo "#GUI Validation"

printTestSeparator "#1.3.10 (Level 1 Scored) Hide detailed errors" 
echo "#manual review web.config"

printTestSeparator "#1.4.1 (Level 2 Not scored) max allowed Content Length"
echo "#manual review web.config"

printTestSeparator "#1.4.2 (Level 2 Scored) maxURL"
echo "#manual review of web.config "

v "#1.4.3 (Level 2 scored) Max Query String "
echo "#Manual Review web.config "

printTestSeparator "#1.4.4 (Level 2 scored) non ASCII chars in url"
echo "#manual review of web.config "

printTestSeparator "#1.4.5 (Level 1 scored) Reject Double encoded requests"

printTestSeparator "#1.4.6 (Level 1 scored)Disallow unlisted file extensions"
echo "#manual review of web.config "

printTestSeparator "#1.4.7 (level 1 Scored) Handler not granted script/execute "
echo "#manual review of ApplicatiohnHost.config in %windir%\system32\inetsrv\config" 

printTestSeparator "#1.4.8 (Level 1 Scored) notListedIsapisAllowed = false"
echo "#manual review of ApplicatiohnHost.config in %windir%\system32\inetsrv\config" 

printTestSeparator "#1.4.9 (Level 1 not scored) notListedCgisAllowed = false" 
echo "#manual review of ApplicatiohnHost.config in %windir%\system32\inetsrv\config" 

printTestSeparator "#1.4.10 (Level 1 Scored) HTTP Trace "
echo "#manual review of web.config "

printTestSeparator "#1.4.11 (Level 1 not scored) Dynamic IP Address Restrictions"
echo "#GUI Review 

echo "#1.5.1 (Level 1 Scored) IIS Web Log Location "
$cmd="$env:SystemRoot\system32\inetsrv\appcmd list config /section:sites"
showAndRun($cmd)

printTestSeparator "#1.5.2 (Level 1 Scored) Advanced Logging" 
echo "#manual Review "

printTestSeparator "#1.5.3 (Level 1 Scored) ETW Logging "
echo "#GUI valdiation "

printTestSeparator "#1.6.1 (Level 1 Not Scored) Encrypt FTP "
echo "#GUI Review "

printTestSeparator "#1.6.2 (Level 1 not scored) Logon attemt limit" 
echo "#Gui Review "


printTestSeparator "#1.7.1 (Level 1 Scored) PCT 1.0 "
$cmd="reg query 'HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols'"
showAndRun($cmd)
$cmd="reg query 'HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\PCT 1.0\Server\Enabled'"
showAndRun($cmd)

printTestSeparator "#1.7.2 (Level 1 Scored) SSL 2.0" 
$cmd="reg query 'HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\'"
showAndRun($cmd)
$cmd="reg query 'HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Server\Enabled'"
showAndRun($cmd) 
$cmd="reg query 'HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Server\DisabledByDefault'"
showAndRun($cmd)

printTestSeparator "#1.7.3 (Level 1 Scored) SSL 3.0" 
$cmd="reg query 'HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\Server\Enabled'"
showAndRun($cmd)
$cmd="reg query 'HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\Server\DisabledByDefault'"
showAndRun($cmd)

printTestSeparator "#1.7.4 (Level 1 Not Scored)TLS 1.0 "
$cmd="reg query 'HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0'"
showAndRun($cmd)
$cmd="reg query 'HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server\DisabledByDefault'"
showAndRun($cmd) 
$cmd="reg query 'HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server\Enabled'"
showAndRun($cmd) 

printTestSeparator "#1.7.5 (Level 1 Not Scored)TLS 1.1"
$cmd="reg query 'HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1'"
showAndRun($cmd) 
$cmd="reg query 'HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Server\DisabledByDefault'"
showAndRun($cmd) 
$cmd="reg query 'HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Server\Enabled'"
showAndRun($cmd)

printTestSeparator "#1.7.6 (Level 1 Not Scored) TLS 1.2 "
$cmd="reg query 'HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2'"
showAndRun($cmd) 
$cmd="reg query 'HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Server\DisabledByDefault'"
showAndRun($cmd) 
$cmd="reg query 'HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Server\Enabled'"
showAndRun($cmd) 

printTestSeparator "#1.7.7 (Level 1 Scored ) Null Ciphers Make Sure enabled is set to 0 "
$cmd="reg query 'HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers'"
showAndRun($cmd)
$cmd="reg query 'HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\NULL\Enabled'"
showAndRun($cmd)

printTestSeparator "#1.7.8 (Level 1 Scored ) 3DES Make sure Enabled is set to 0"
$cmd="reg query 'HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\DES 56/56'"
showAndRun($cmd)
$cmd="reg query 'HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\DES 56/56\Enabled'"
showAndRun($cmd)

printTestSeparator "#1.7.9 (Level 1 Scored ) RC2 Make sure Enabled is set to 0 "
$cmd="reg query 'HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC2 40/128'"
showAndRun($cmd)
$cmd="reg query 'HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC2 40/128\Enabled'"
showAndRun($cmd) 

printTestSeparator "#1.7.10 (Level 1 Scored ) RC4 Make sure Enabled is set to 0 "
$cmd="reg query 'HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC4 40/128'"
showAndRun($cmd)
$cmd="reg query 'HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC4 40/128\Enabled'"
showAndRun($cmd)

printTestSeparator "#1.7.11 (Level 1 Not Scored ) 3DES Make sure Enabled is set to 0" 
$cmd="reg query 'HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\Triple DES 168/168'"
showAndRun($cmd)
$cmd="reg query 'HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\Triple DES 168/168\Enabled'"
showAndRun($cmd)

printTestSeparator "#1.7.12 (Level 1 Not Scored )  AES 128 Should Be enabled "
$cmd="reg query 'HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\AES 128/128'"
showAndRun($cmd)
$cmd="reg query 'HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\AES 128/128\Enabled'"
showAndRun($cmd)

printTestSeparator "#1.7.13 (Level 1 Scored ) AES 256 Should Be enabled" 
$cmd="reg query 'HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\AES 256/256'"
showAndRun($cmd)
$cmd="reg query 'HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\AES 256/256\Enabled'"
showAndRun($cmd)

printTestSeparator "#1.7.14 (Level 2 Scored ) Cipher Ordering "
$cmd="reg query 'HKLM\System\CurrentControlSet\Control\Cryptography\Configureatio\Local\SSL\00010002\Functions'"
showAndRun($cmd)

Stop-Transcript
