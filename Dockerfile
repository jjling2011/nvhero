FROM alpine

ENV PORT=8080
EXPOSE 8080

ADD res /res

#install stuff
RUN apk --update add nginx supervisor gettext libintl \
    && rm -rf /var/cache/apk/* \
    && rm -rf /var/www/html \
    && mkdir -p /etc/supervisor.d \
    && cp /res/conf/supervisord/supervisor.ini /etc/supervisor.d/ \
    && mkdir -p /var/tmp/supervisor \
    && mkdir -p /var/tmp/nginx \
    && chmod -R a+rwx /var/tmp \
    && chmod -R a+rwx /var/lib/nginx \
    && chmod -R a+rwx /var/log/nginx \
    && chmod -R a+rwx /run/ \
    && chmod -R a+rwx /etc/nginx/conf.d/ \
    && cp /res/conf/nginx/nginx.conf /etc/nginx/nginx.conf \
    && cp /res/conf/nginx/default.conf /etc/nginx/conf.d/default.conf \
    && chmod a+rw /res/v2ray


CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor.d/supervisor.ini"]
