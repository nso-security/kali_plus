#!/bin/bash -v
#gitrob
git clone https://github.com/michenriksen/gitrob.git /opt/gitrob 
gem install bundler 
service postgresql start 
sudo -u postgres createuser -s gitrob --pwprompt 
sudo -u postgres createdb -O gitrob gitrob 
cd /opt/gitrob/bin

gem install gitrob   
