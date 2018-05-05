#!/usr/bin/env bash
docker container  run \
    -p 443:443 \
    --rm \
    -d \
    --volume "$PWD/../../res":/res/ \
    --name nvhero\
    nvhero

