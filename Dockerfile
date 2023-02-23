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
COPY lxsb /usr/local/lxsb/

RUN chmod a+x /usr/local/lxsb/entrypoint.sh
    
ENTRYPOINT [ "/usr/local/lxsb/entrypoint.sh" ]
