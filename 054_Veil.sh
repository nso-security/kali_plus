#!/bin/bash -v
git clone https://github.com/Veil-Framework/Veil /opt/Veil 
cd /opt/Veil/ && ./Install.sh -c
#note, this will require user interaction
/opt/Veil/Veil-Evasion/setup/setup.sh
