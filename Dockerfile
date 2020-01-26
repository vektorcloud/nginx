FROM quay.io/vektorcloud/base:3.11

RUN echo "@edge http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
    apk add --no-cache nginx@edge nginx-mod-http-geoip@edge && \
    mkdir -p /var/{cache,log,lib,run}/nginx /var/lib/nginx/tmp && \
    chown -Rf nginx. /var/{cache,log,lib,run}/nginx

COPY default.conf /etc/nginx/conf.d/default.conf

ENTRYPOINT ["nginx", "-g", "daemon off; error_log /dev/stderr info; pid /var/run/nginx.pid;"]
