FROM quay.io/vektorcloud/base:3.6

RUN echo "@edge http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
    apk add --no-cache nginx@edge nginx-mod-http-geoip@edge && \
    mkdir -p /var/cache/nginx /var/log/nginx && \
    chown -Rf nginx. /var/cache/nginx /var/log/nginx

ENTRYPOINT [ "nginx" ]
CMD ["-g", "daemon off; error_log  /dev/stderr info; access_log /dev/stdout;"]
