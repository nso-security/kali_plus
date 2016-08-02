#copy this to web root, change to executable and then python fielneam
#for creating the cert, run this command
#openssl req -x509 -new -keyout server.pem -out server.pem -days 10 -nodes

import BaseHTTPServer
import SimpleHTTPServer
import ssl
import logging
import cgi
class ServerHandler(SimpleHTTPServer.SimpleHTTPRequestHandler):

    def do_GET(self):
        logging.warning("======= GET STARTED =======")
        logging.warning(self.headers)
        SimpleHTTPServer.SimpleHTTPRequestHandler.do_GET(self)

    def do_POST(self):
        logging.warning("======= POST STARTED =======")
        logging.warning(self.headers)
        form = cgi.FieldStorage(
            fp=self.rfile,
            headers=self.headers,
            environ={'REQUEST_METHOD':'POST',
                     'CONTENT_TYPE':self.headers['Content-Type'],
                     })
        logging.warning("======= POST VALUES =======")
        for item in form.list:
            logging.warning(item)
        logging.warning("\n")
        SimpleHTTPServer.SimpleHTTPRequestHandler.do_GET(self)

listenPort=4443
print ('Listening on {0}\n').format(listenPort);

httpd = BaseHTTPServer.HTTPServer(('0.0.0.0', listenPort), ServerHandler)
httpd.socket = ssl.wrap_socket (httpd.socket, certfile='./server.pem', server_side=True)
httpd.serve_forever()



#For Python 3
# import http.server
#httpd = http.server.HTTPServer(('0.0.0.0', listenPort), http.server.SimpleHTTPRequestHandler)
#httpd.socket = ssl.wrap_socket (httpd.socket, certfile='./server.pem', server_side=True)
#httpd.serve_forever()
