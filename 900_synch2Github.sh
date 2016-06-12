#!/bin/bash -v

cd /opt/kali_plus
git pull
chmod -R 700 * 
git add *
git commit -m "synching"
git push origin master
