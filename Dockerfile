FROM alpine

ADD res /res

#install stuff
RUN apk --update add nginx supervisor gettext libintl wget bash\
    && rm -rf /var/cache/apk/* \
    && rm -rf /var/www/html \
    && mkdir -p /var/log/supervisord \
    && cp /res/conf/nginx/nginx.conf /etc/nginx/nginx.conf \
    && mkdir -p /etc/supervisor.d \
    && cp /res/conf/supervisord/supervisor.ini /etc/supervisor.d/ \
    && cd /res/v2ray \
    && wget -O v2ray.zip https://github.com/v2ray/v2ray-core/releases/download/v4.22.1/v2ray-linux-64.zip \
    && unzip v2ray.zip \
    && rm /res/v2ray/config.json 

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor.d/supervisor.ini"]
