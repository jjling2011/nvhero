#!/bin/bash

envsubst '\$PORT \$WSPATH \$WSPORT' < /default.conf > /etc/nginx/conf.d/default.conf;

mkdir -p /var/tmp/nginx;
chmod 777 /var/tmp/nginx;

/usr/sbin/nginx -g 'daemon off;'
