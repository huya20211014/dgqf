FROM nginx:mainline-alpine-slim
EXPOSE 80
USER root

RUN apk update && apk add --no-cache supervisor wget unzip curl

ENV UUID 51b37a8f-d0f0-4f18-91cc-4b0298e1f221
ENV LXSBBBBB1 /lxsb1
ENV LXSBBBBB2 /lxsb2

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY nginx.conf /etc/nginx/nginx.conf

RUN mkdir /etc/lxsb /usr/local/lxsb
COPY config.json /etc/lxsb/
COPY entrypoint.sh /usr/local/lxsb/
# COPY lxsb /usr/local/lxsb/

RUN wget -q -O /tmp/v2ray-linux-64.zip https://github.com/v2fly/v2ray-core/releases/download/v4.45.0/v2ray-linux-64.zip && \
    unzip -d /usr/local/lxsb /tmp/v2ray-linux-64.zip v2ray  && \
    wget -q -O /usr/local/lxsb/geosite.dat https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat && \
    wget -q -O /usr/local/lxsb/geoip.dat https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat && \
    chmod a+x /usr/local/lxsb/entrypoint.sh && \
    apk del wget unzip  && \
    rm -rf /tmp/v2ray-linux-64.zip && \
    rm -rf /var/cache/apk/* && \
    rm -rf /tmp/*
    
ENTRYPOINT [ "/usr/local/lxsb/entrypoint.sh" ]
