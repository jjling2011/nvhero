#!/bin/bash

defconf=/etc/nginx/conf.d/default.conf

cp /res/conf/nginx/default.conf ${defconf}

sed -i "s/__PORT__/${PORT}/g" ${defconf}
sed -i "s#__WSPATH__#${WSPATH}#g" ${defconf}

mkdir -p /var/tmp/nginx;
chmod 777 /var/tmp/nginx;

/usr/sbin/nginx -g 'daemon off;'
