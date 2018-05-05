FROM alpine

ADD res /res

#install stuff
RUN apk --update add nginx supervisor gettext libintl \
    && rm -rf /var/cache/apk/* \
    && rm -rf /var/www/html \
    && mkdir -p /var/log/supervisord \
    && cp /res/conf/nginx/nginx.conf /etc/nginx/nginx.conf \
    && mkdir -p /etc/supervisor.d \
    && cp /res/conf/supervisord/supervisor.ini /etc/supervisor.d/

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor.d/supervisor.ini"]
