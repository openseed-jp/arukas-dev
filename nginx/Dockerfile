FROM openseed/arukas-dev:1.0-sshd

RUN apk --no-cache add nginx php7-fpm && \
mkdir -p /run/nginx /etc/nginx/conf.location.d && \
sed -i /etc/php7/php-fpm.d/www.conf \
  -e 's/^user = nobody$/user = nginx/g'  \
  -e 's/^group = nobody$/group = nginx/g' \
  -e 's/^;listen.owner = nobody$/listen.owner = nginx/g' \
  -e 's/^;listen.group = nobody$/listen.group = nginx/g' \
  -e 's!^listen = 127.0.0.1:9000$!listen = /var/run/php-fpm.sock!g' && \
echo "StreamLocalBindMask 0111" >> /etc/ssh/sshd_config && \
echo "StreamLocalBindUnlink yes" >>  /etc/ssh/sshd_config

COPY ./default.conf /etc/nginx/conf.d/default.conf
COPY ./entrypoint-nginx.sh /root/entrypoint-nginx.sh
COPY ./entrypoint.sh /root/entrypoint.sh

ENTRYPOINT [ "/root/entrypoint.sh" ]
