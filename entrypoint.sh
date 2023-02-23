#!/bin/sh
# Create By ifeng
# Web Site:https://www.hicairo.com
# Telegram:https://t.me/HiaiFeng

sed -i "s#UUID#$UUID#g;s#LXSBBBBB1#$LXSBBBBB1#g;s#LXSBBBBB2#$LXSBBBBB2#g" /etc/lxsb/config.json
sed -i "s#LXSBBBBB1#$LXSBBBBB1#g;s#LXSBBBBB2#$LXSBBBBB2#g" /etc/nginx/nginx.conf
# exec "$@"

# 请删掉下一行最前面的 # 号，同时将这行代码中的域名替换成 Replit 为你项目分配的域名。
#while true ;do curl https://xx.xx.repl.co; sleep 300; done &

/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
