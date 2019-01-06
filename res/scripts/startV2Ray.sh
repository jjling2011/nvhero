#!/bin/bash

root=/res/v2ray
cd ${root}

if [ ! -f /res/v2ray/v2ray.zip ]; then
  wget -O v2ray.zip \
      https://github.com/v2ray/v2ray-core/releases/download/v${VER}/v2ray-linux-64.zip
fi

unzip v2ray.zip

cd "./v2ray-v${VER}-linux-64/"

cp ${root}/config_server.json ./config.json
sed -i "s/__UUID__/${UUID}/g" ./config.json
sed -i "s#__WSPATH__#${WSPATH}#g" ./config.json

chmod +x v2ctl
chmod +x v2ray
./v2ray
