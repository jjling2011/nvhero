echo "Hello, world!"

echo "config nginx"
cp /res/nginx.default.conf /etc/nginx/conf.d/default.conf
sed -i "s/__PORT__/${PORT}/g" /etc/nginx/conf.d/default.conf
sed -i "s#__WSPATH__#${WSPATH}#g" /etc/nginx/conf.d/default.conf
sed -i "s/__WSPORT__/${V2RAYPORT}/g" /etc/nginx/conf.d/default.conf

echo "support ssl"
mkdir /etc/nginx/ssl/ && \
	openssl req -x509 -newkey rsa:4096 \
    -keyout /etc/nginx/ssl/example.key \
    -out /etc/nginx/ssl/example.crt \
    -days 365 \
    -subj "/CN=${APPNAME}.heroku.com" \
    -nodes -sha256 && \
	chmod 400 /etc/nginx/ssl/example.key

echo "prepare v2ray"
root=/res/v2ray
cd ${root}
if [ ! -f /res/v2ray/v2ray.zip ]; then
  echo "download v2ray"
  wget -O v2ray.zip http://github.com/v2ray/v2ray-core/releases/download/v${VER}/v2ray-linux-64.zip
fi
unzip v2ray.zip

cd v2ray-v${VER}-linux-64
# config
cp ${root}/config_server.json ./config.json
sed -i "s/__UUID__/${UUID}/g" ./config.json
sed -i "s/\"__PORT__\"/${V2RAYPORT}/g" ./config.json
sed -i "s#__WSPATH__#${WSPATH}#g" ./config.json
chmod +x v2ray
chmod +x v2ctl

#run
/usr/sbin/nginx
./v2ray
