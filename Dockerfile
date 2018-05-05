FROM jacopomeloni/nginxphpfpm-heroku

EXPOSE $PORT

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor.d/supervisor.ini"]
