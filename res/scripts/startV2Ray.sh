#!/bin/bash

root=/res/v2ray
cd ${root}

if [ "x${REMOTE_SERVER}" == "xon" ]; then
  cp ${root}/config_relay.json ./config.json
  sed -i "s/__OUT_SERVER__/${OUT_SERVER}/g" ./config.json
  sed -i "s/__OUT_UUID__/${OUT_UUID}/g" ./config.json
  sed -i "s#__OUT_WSPATH__#${OUT_WSPATH}#g" ./config.json
else
  cp ${root}/config_outlet.json ./config.json
fi

sed -i "s/__IN_UUID__/${IN_UUID}/g" ./config.json
sed -i "s#__IN_WSPATH__#${IN_WSPATH}#g" ./config.json

chmod +x v2ctl
chmod +x v2ray
./v2ray
