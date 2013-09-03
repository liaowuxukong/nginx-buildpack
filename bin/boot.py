#!/usr/bin/env python
#
# Simple HTTP Server for accessing files in target director
#
import SimpleHTTPServer
import SocketServer
import os
import sys

if len(sys.argv) == 2:
    print 'Serving files from [%s]' % sys.argv[1]
    os.chdir(sys.argv[1])
else:
    print 'Service files from [%s]' % os.getcwd()
port = int(os.environ.get('VCAP_APP_PORT', 8080)
print 'port--->'
print port

httpd = SocketServer.TCPServer(
    (os.environ.get('VCAP_APP_HOST', 'localhost'),
     int(os.environ.get('VCAP_APP_PORT', 8080))),
    SimpleHTTPServer.SimpleHTTPRequestHandler)
httpd.serve_forever()
