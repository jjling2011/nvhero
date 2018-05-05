FROM php:7.2-fpm-alpine

ADD res /res

#install stuff
RUN apk --update add nginx supervisor gettext libintl \
    && mv /usr/bin/envsubst /usr/local/sbin/envsubst \
    && rm -rf /var/cache/apk/* \
    && rm -rf /var/www/html \
    && mkdir -p /var/log/supervisord \
    && cp /res/conf/nginx/nginx.conf /etc/nginx/nginx.conf \
    && cp /res/conf/phpfpm/php-fpm.conf /usr/local/etc/php-fpm.conf \
    && cp /res/conf/phpfpm/www.conf /usr/local/etc/php-fpm.d/www.conf \
    && mkdir -p /etc/supervisor.d \
    && cp /res/conf/supervisord/supervisor.ini /etc/supervisor.d/

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor.d/supervisor.ini"]
