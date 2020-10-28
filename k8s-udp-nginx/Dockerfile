FROM alpine:latest

ENV NGINX_VERSION nginx-1.19.3

RUN apk --update add openssl-dev pcre-dev zlib-dev wget build-base supervisor && \
    mkdir -p /tmp/src && \
    cd /tmp/src && \
    wget http://nginx.org/download/${NGINX_VERSION}.tar.gz && \
    tar -zxvf ${NGINX_VERSION}.tar.gz && \
    cd /tmp/src/${NGINX_VERSION} && \
    ./configure \
        --with-stream \
        --prefix=/etc/nginx \
        --http-log-path=/var/log/nginx/access.log \
        --error-log-path=/var/log/nginx/error.log \
        --sbin-path=/usr/local/sbin/nginx && \
    make && \
    make install && \
    apk del build-base && \
    rm -rf /tmp/src && \
    rm -rf /var/cache/apk/*

COPY etc/nginx/conf/nginx.conf /etc/nginx/conf/nginx.conf
COPY supervisord.conf /etc/supervisord.conf
COPY reload_config.sh /reload_config.sh
COPY stop-supervisor.sh /stop-supervisor.sh

RUN chmod 755 /stop-supervisor.sh
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

VOLUME ["/var/log/nginx"]

WORKDIR /etc/nginx

EXPOSE 5353

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
