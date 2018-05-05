FROM jacopomeloni/nginxphpfpm-heroku

ADD res /res

RUN cp /res/conf/* / && \
    mv /supervisor.ini /etc/supervisor.d/supervisor.ini && \
    chmod +x /startNginx.sh && \
    chmod +x /startV2Ray.sh

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor.d/supervisor.ini"]
