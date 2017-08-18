FROM quay.io/vektorcloud/base:3.6

RUN apk add --no-cache nginx && \
    mkdir -p /var/cache/nginx /var/log/nginx /run/nginx && \
    chown -Rf nginx. /var/cache/nginx /var/log/nginx

COPY nginx.conf /etc/nginx/
COPY default.conf /etc/nginx/conf.d/

ENTRYPOINT [ "nginx" ]
