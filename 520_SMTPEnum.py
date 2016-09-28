#!/usr/bin/python
import socket
import sys
if len(sys.argv) != 3:
  print "*** sorry, I take two and only two argments - the name you want to check and the SMTP Server iP to query"
  sys.exit(0)
s=socket.socket(socket.AF_INET, socket.SOCK_STREAM)
connect=s.connect((sys.argv[2],25))
srvresponse=s.recv(1024)
print srvresponse
# SMTP Verb
s.send('VRFY ' + sys.argv[1] + '\r\n')
result=s.recv(1024)
print result
s.close()
