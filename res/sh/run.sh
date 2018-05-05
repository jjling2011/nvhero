#!/usr/bin/env bash

docker run \
    --rm \
    -p 443:443 \
    --env-file ./env.list  \
    --name nvhero \
    nvhero
