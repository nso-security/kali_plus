FOR /F "usebackq" %%i IN (`hostname`) DO SET HOST_NAME=%%i-BasicEnum
echo ===============System Profile Results===============> %HOST_NAME%.txt
echo ####################Basic Information####################>> %HOST_NAME%.txt
hostname >> %HOST_NAME%.txt
ver >> %HOST_NAME%.txt
systeminfo >>%HOST_NAME%.txt
echo. ~~~~~~~~~~~~~~Drives~~~~~~~~~~~~~~ >> %HOST_NAME%.txt
fsutil fsinfo drives >> %HOST_NAME%.txt
echo. ~~~~~~~~~~~~~~Shares~~~~~~~~~~~~~~>> %HOST_NAME%.txt
net share >> %HOST_NAME%.txt
echo. ~~~~~~~~~~~~~~SMBSessions~~~~~~~~~~~~~~>> %HOST_NAME%.txt
net session  >> %HOST_NAME%.txt
echo. ~~~~~~~~~~~~~~Patches~~~~~~~~~~~~~~ >>%HOST_NAME%.txt
wmic /append:%HOST_NAME%.txt qfe list >nul
echo. & echo. ~~~~~~~~~~~~~~System Variables~~~~~~~~~~~~~~ >>%HOST_NAME%.txt
set >>%HOST_NAME%.txt
echo. ####################Network#################### >>%HOST_NAME%.txt
echo. ~~~~~~~~~~~~~~ipconfig /all~~~~~~~~~~~~~~>> %HOST_NAME%.txt
ipconfig /all  >> %HOST_NAME%.txt
echo. ~~~~~~~~~~~~~~dns dump~~~~~~~~~~~~~~ >>%HOST_NAME%.txt
ipconfig /displaydns >>%HOST_NAME%.txt
echo. ~~~~~~~~~~~~~~arp -a~~~~~~~~~~~~~~>> %HOST_NAME%.txt
arp -a  >> %HOST_NAME%.txt
echo. ~~~~~~~~~~~~~~route print~~~~~~~~~~~~~~>> %HOST_NAME%.txt
route  print >>%HOST_NAME%.txt
echo. ~~~~~~~~~~~~~~ netsh firewall show config ~~~~~~~~~~~~~~>> %HOST_NAME%.txt
netsh firewall show config >>%HOST_NAME%.txt
echo. ~~~~~~~~~~~~~~wireless~~~~~~~~~~~~~~>> %HOST_NAME%.txt
netsh wlan show all >> %HOST_NAME%.txt
echo. ~~~~~~~~~~~~~~interfaces~~~~~~~~~~~~~~>> %HOST_NAME%.txt
netsh interface ip show interfaces >> %HOST_NAME%.txt
echo. ~~~~~~~~~~~~~~net view~~~~~~~~~~~~~~ >>%HOST_NAME%.txt
net view >> %HOST_NAME%.txt
echo. ~~~~~~~~~~~~~~ netstat -na ~~~~~~~~~~~~~~>> %HOST_NAME%.txt
netstat -na >>%HOST_NAME%.txt
echo. ~~~~~~~~~~~~~~ netstat -nab  (w proc name if avail) ~~~~~~~~~~~~~~>> %HOST_NAME%.txt
netstat -nab >>%HOST_NAME%.txt
echo. ~~~~~~~~~~~~~~ netstat -e -s ~~~~~~~~~~~~~~>> %HOST_NAME%.txt
netstat -e -s >> %HOST_NAME%.txt
echo. ####################Currently Running/Avail####################>> %HOST_NAME%.txt
echo. ~~~~~~~~~~~~~~tasklist /v~~~~~~~~~~~~~~>> %HOST_NAME%.txt
tasklist /V >> %HOST_NAME%.txt
echo. ~~~~~~~~~~~~~~tasklist /SVC~~~~~~~~~~~~~~>> %HOST_NAME%.txt
tasklist /SVC >> %HOST_NAME%.txt
echo. ~~~~~~~~~~~~~~wmic process list full~~~~~~~~~~~~~~>> %HOST_NAME%.txt
wmic /append:%HOST_NAME%.txt process list brief >nul
wmic /append:%HOST_NAME%.txt process list full >nul

echo. ~~~~~~~~~~~~~~Installed Programs~~~~~~~~~~~~~~ >>%HOST_NAME%.txt
dir "%ProgramFiles%">>%HOST_NAME%.txt
echo. ~~~~~~~~~~~~~~Installed ProgramsX86~~~~~~~~~~~~~~ >>%HOST_NAME%.txt
dir "%ProgramFiles(x86)%" >>%HOST_NAME%.txt
echo. ~~~~~~~~~~~~~~Uninstallable~~~~~~~~~~~~~~ >>%HOST_NAME%.txt
reg query HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Uninstall >>%HOST_NAME%.txt
echo. ~~~~~~~~~~~~~~show services~~~~~~~~~~~~~~ >>%HOST_NAME%.txt
sc query state= all >>%HOST_NAME%.txt
echo. ####################Local Users and Groups#################### >>%HOST_NAME%.txt
echo. ~~~~~~~~~~~~~~net user~~~~~~~~~~~~~~ >>%HOST_NAME%.txt
net user >>%HOST_NAME%.txt
echo.  ~~~~~~~~~~~~~~net localgroup~~~~~~~~~~~~~~ >>%HOST_NAME%.txt
net localgroup >>%HOST_NAME%.txt
echo.  ~~~~~~~~~~~~~~net localgroup administrators~~~~~~~~~~~~~~ >>%HOST_NAME%.txt
net localgroup administrators >>%HOST_NAME%.txt
echo.  ~~~~~~~~~~~~~~passwords in registry~~~~~~~~~~~~~~ >>%HOST_NAME%.txt
reg query HKLM /f password /t REG_SZ /s  >>%HOST_NAME%.txt
echo.  ~~~~~~~~~~~~~~UnquotedServicePaths~~~~~~~~~~~~~~ >>%HOST_NAME%.txt
wmic service get name,displayname,pathname,startmode |findstr /i "auto" |findstr /i /v "c:\windows\\" | findstr /i /v """ >>%HOST_NAME%.txt
echo.  ~~~~~~~~~~~~~~Kerberos Tickets~~~~~~~~~~~~~~ >>%HOST_NAME%.txt
klist
 echo. ===========================END==================== >>%HOST_NAME%.txt

