#!/bin/bash

# Make sure we're not confused by old, incompletely-shutdown httpd
# context after restarting the container.  httpd won't start correctly
# if it thinks it is already running.
echo cleaning rundirs
rm -rf /run/httpd/* /tmp/httpd*

if [ ! -f /etc/server.key ]; then 
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/server.key -out /etc/server.crt  -subj "/C=IT/ST=Italy/L=Pescara/O=LOOKCAST/OU=devops/CN=${HOSTNAME}"
fi

echo starting httpd
exec /usr/sbin/apachectl -DFOREGROUND
