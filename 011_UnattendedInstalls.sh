#!/bin/bash -v
cd /opt/wbm_kali
./030_back-door-factory.sh

cd /opt/wbm_kali
./031_recon-ng.sh

cd /opt/wbm_kali
./032_masscan.sh

cd /opt/wbm_kali
./034_CMS-Scanners.sh

cd /opt/wbm_kali
./035_Discover.sh

cd /opt/wbm_kali
./037_Responder.sh

cd /opt/wbm_kali
./038_PowershellTools.sh

cd /opt/wbm_kali
./039_hacker-play-book.sh

cd /opt/wbm_kali
./040_sparta.sh

cd /opt/wbm_kali
./041_spiderfoot.sh

cd /opt/wbm_kali
./042_mimikatz.sh

cd /opt/wbm_kali
./043_SET.sh

cd /opt/wbm_kali
./044_NetCreds.sh 

cd /opt/wbm_kali
./045_firefox.sh

cd /opt/wbm_kali
./046_httpscreenshot.sh

cd /opt/wbm_kali
./048_EyeWitness.sh

cd /opt/wbm_kali
./049_PrinterExploits.sh

cd /opt/wbm_kali
./050_dshashes.sh

cd /opt/wbm_kali
./051_NoSQLMap.sh

cd /opt/wbm_kali
./052_WinCredEditor.sh

cd /opt/wbm_kali
./053_FuzzingLists.sh

cd /opt/wbm_kali
./054_Veil.sh

cd /opt/wbm_kali
./100_tmuxlogging.sh

cd /opt/wbm_kali

#misc apt-get
sudo apt-get -y install pdftk
