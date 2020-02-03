#!/bin/bash

defconf=/etc/nginx/conf.d/default.conf

cp /res/conf/nginx/default.conf ${defconf}

sed -i "s/__PORT__/${PORT}/g" ${defconf}
sed -i "s#__IN_WSPATH__#${IN_WSPATH}#g" ${defconf}

mkdir -p /var/tmp/nginx;
chmod 777 /var/tmp/nginx;

/usr/sbin/nginx -g 'daemon off;'
