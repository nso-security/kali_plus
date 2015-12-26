#!/usr/bin/env python
#
# StartListener.py
# Simple python script to start a Meterpreter HTTPs Handler
# by Chris Campbell (obscuresec)
#
import sys
import subprocess
#write a resource file and call it
def build(company):
  rcPath="/opt/local"
  rcFileName="{0}/{1}".format(rcPath,"recon-ng_standard.rc")
  commands = "workspaces select {0}".format(company)
  commands += """
#Look through Bing for domain names
use recon/domains-hosts/bing_domain_web 
run
back
#Look through Google for domain names
use recon/domains-hosts/google_site_web
run
back
#Look through Baidu
use recon/domains-hosts/baidu_site 
run
back
#Brute-force subdomains
use recon/domains-hosts/brute_hosts
run
back
#Look at netcraft for domain names
use recon/domains-hosts/netcraft
run
back
#Shodan requires subscription
#use recon/domains-hosts/shodan_hostname
#run
#back
use recon/hosts-hosts/reverse_resolve
run
back
use recon/hosts-hosts/resolve
run
back
use recon/hosts-hosts/bing_ip
run
back
use recon/hosts-hosts/ipinfodb
run
back
use recon/domains-hosts/ssl_san
run
back
use recon/domains-hosts/vpnhunter
run
back
use discovery/info_disclosure/interesting_files
run
back
#Should probably manually clean out the database.
use recon/domains-hosts/builtwith
run
back
#you may have to review builtwith manually
use recon/hosts-hosts/freegeoip
run 
back           
#VULNS
use recon/domains-vulnerabilities/punkspider
run
back
#note, you may have to set vulns true to get the actual results             
use recon/domains-vulnerabilities/xssed
run
back
#Note, had trouble with this module on 12/22/2015
use recon/netblocks-ports/census_2012
run
back
#CONTACTS
use recon/domains-contacts/pgp_search
run
back
use recon/domains-contacts/whois_pocs
run
back
use recon/domains-contacts/salesmaple
run
back
use recon/domains-contacts/metacrawler
run
back
use recon/contacts-contacts/mailtester
run
back
#Note, you may have to [Ctrl]-[C] if mail server doesn't validate
#Note< use reporting/html; setfilename <file>; run;back; """
  filewrite = file(rcFileName, "w")
  filewrite.write(commands)
  filewrite.close()

#grab args
try:
  company = sys.argv[1]
  build(company)

#index error
except IndexError:
  print "usage python 711_recon-ng_generator2.py workspace"

