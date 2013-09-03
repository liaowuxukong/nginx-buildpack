#!/usr/bin/env python
#
# Simple HTTP Server for accessing files in target director
#
import SimpleHTTPServer
import SocketServer
import os
import sys


httpd = SocketServer.TCPServer(
    (os.environ.get('VCAP_APP_HOST', 'localhost'),
     int(os.environ.get('VCAP_APP_PORT', 8080))),
    SimpleHTTPServer.SimpleHTTPRequestHandler)
httpd.serve_forever()
