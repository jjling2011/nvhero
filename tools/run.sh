#!/usr/bin/env bash

docker run \
    --rm \
    -p 80:80 \
    --env-file ./env.list  \
    --name v2ray-openshift \
    v2ray-openshift
