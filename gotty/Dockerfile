FROM openseed/arukas-dev:1.0-sshd-nginx

COPY ./entrypoint.sh /root/entrypoint.sh
COPY ./entrypoint-gotty.sh /root/entrypoint-gotty.sh
COPY ./nginx-location.conf /etc/nginx/conf.location.d/tty-location.conf

#https://github.com/sgerrand/alpine-pkg-glibc
RUN set -x && \
cd /tmp && \
apk --no-cache add ca-certificates wget tmux bash && \
wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.29-r0/glibc-2.29-r0.apk && \
apk add glibc-2.29-r0.apk && \
wget https://github.com/yudai/gotty/releases/download/v1.0.1/gotty_linux_amd64.tar.gz && \
tar zxf gotty_linux_amd64.tar.gz -C /usr/local/bin/.  && \
rm -rf /tmp/* /var/cache/apk/*

ENTRYPOINT ["/root/entrypoint.sh"]
