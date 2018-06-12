#!/bin/bash

defconf=/etc/nginx/conf.d/default.conf

sed -i "s/__PORT__/${PORT}/g" ${defconf}
sed -i "s#__WSPATH__#${WSPATH}#g" ${defconf}

/usr/sbin/nginx -g 'daemon off;'
