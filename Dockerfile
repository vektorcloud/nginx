FROM quay.io/vektorcloud/base:3.5

RUN echo "@edge http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
    apk add --no-cache nginx@edge nginx-mod-http-geoip@edge && \
    mkdir -p /var/cache/nginx /var/log/nginx && \
    chown -Rf nginx. /var/cache/nginx /var/log/nginx

COPY nginx.conf /etc/nginx/nginx.conf

ENTRYPOINT [ "nginx" ]
