#!/bin/bash

root=/res/v2ray
cd ${root}

if [ ! -f /res/v2ray/v2ray.zip ]; then
  wget -O v2ray.zip https://github.com/v2ray/v2ray-core/releases/download/v${VER}/v2ray-linux-64.zip
fi

unzip v2ray.zip

if [ "x${REMOTE_SERVER}" == "xon" ]; then
  cp ${root}/config_relay.json ./config.json
  sed -i "s/__OUT_SERVER__/${OUT_SERVER}/g" ./config.json
  sed -i "s/__OUT_USERNAME__/${OUT_USERNAME}/g" ./config.json
  sed -i "s/__OUT_PASSWORD__/${OUT_PASSWORD}/g" ./config.json
  sed -i "s#__OUT_WSPATH__#${OUT_WSPATH}#g" ./config.json
else
  cp ${root}/config_outlet.json ./config.json
fi

sed -i "s/__IN_USERNAME__/${IN_USERNAME}/g" ./config.json
sed -i "s/__IN_PASSWORD__/${IN_PASSWORD}/g" ./config.json
sed -i "s#__IN_WSPATH__#${IN_WSPATH}#g" ./config.json

chmod +x v2ctl
chmod +x v2ray
./v2ray
