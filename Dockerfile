FROM quay.io/vektorcloud/base:3.5

ENV NGINX_VERSION 1.12.0
ENV NGINX_SRC_URL http://nginx.org/download/nginx-$NGINX_VERSION.tar.gz

RUN set -ex  \
  && apk add --no-cache \
    openssl \
    pcre \
  && apk add --no-cache --virtual .build-deps \
      bash \
      curl \
      g++  \
      gcc \
      make \
      openssl-dev \
      pcre-dev \
      zlib-dev \
  && curl -s -o /tmp/nginx-$NGINX_VERSION.tar.gz $NGINX_SRC_URL \
  && adduser -h /var/cache/nginx -s /sbin/nologin -D nginx \
  && cd /tmp \
  && tar xvf nginx-$NGINX_VERSION.tar.gz \
  && cd nginx-$NGINX_VERSION  \
  && ./configure \
    --prefix=/var/lib/nginx \
    --sbin-path=/usr/sbin/nginx \
    --conf-path=/etc/nginx/nginx.conf \
    --pid-path=/run/nginx/nginx.pid \
    --lock-path=/run/nginx/nginx.lock \
    --user=nginx \
    --group=nginx \
    --with-threads \
    --with-http_ssl_module \
    --with-http_v2_module \
  && make \
  && make install \
  && cd / \
  && rm -rf /tmp/* \
  && apk del .build-deps

COPY nginx.conf /etc/nginx/nginx.conf

CMD [ "nginx", "-c", "/etc/nginx/nginx.conf"]
