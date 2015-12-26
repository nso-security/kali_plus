#!/usr/bin/env python
#
# StartListener.py
# Simple python script to start a Meterpreter HTTPs Handler
# by Chris Campbell (obscuresec)
#
import sys
import subprocess
import os
#write a resource file and call it
def build(company, domain):
  rcPath="/opt/local"
  rcFileName="{0}/{1}".format(rcPath,"recon-ng_initial.rc")
  commands = ""
  commands += "workspaces add {0}\n".format(company)
  commands += "add domains {0}\n".format(domain)
  commands += "set customer {0}\n".format(company)
  commands += "set creator {0}\n".format("wbmartin")
  commands += "keys list\n"
  commands += "#verify keys listed for [bing_api, builtwith_api, infodb_api].  add missing with 'keys add bing_api <key>'."
  
  commands += "#execute 'add companies' which is a dialog\n"




  if not os.path.exists(rcPath):
    os.makedirs(rcPath) 
  filewrite = file(rcFileName, "w")
  filewrite.write(commands)
  filewrite.close()



#grab args
try:
  company = sys.argv[1]
  domain = sys.argv[2]
  build(domain,company)

#index error
except IndexError:
  print "usage: python 710_recon-ng_generator.py domain company"

