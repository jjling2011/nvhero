#!/usr/bin/env bash
docker container  run \
    -p 443:443 \
    --rm \
    -d \
    --volume "$PWD/../../res":/res/ \
    --volume "$PWD/../nginx":/etc/nginx \
    --name nginx \
    nginx
