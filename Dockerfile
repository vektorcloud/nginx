FROM quay.io/vektorcloud/base:3.8

RUN echo "@edge http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
    apk add --no-cache nginx@edge nginx-mod-http-geoip@edge && \
    mkdir -p /var/cache/nginx /var/log/nginx /run/nginx && \
    chown -Rf nginx. /var/cache/nginx /var/log/nginx /run/nginx

COPY default.conf /etc/nginx/conf.d/default.conf

ENTRYPOINT [ "nginx" ]
