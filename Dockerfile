FROM quay.io/vektorcloud/base:3.5

RUN apk add --no-cache nginx && \
    mkdir -p /var/cache/nginx /var/log/nginx && \
    chown -Rf nginx. /var/cache/nginx /var/log/nginx

COPY nginx.conf /etc/nginx/nginx.conf

ENTRYPOINT [ "nginx" ]
