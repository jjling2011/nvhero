FROM jacopomeloni/nginxphpfpm-heroku

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor.d/supervisor.ini"]
