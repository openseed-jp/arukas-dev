#!/bin/sh

sed -i -e "s!\$MARATHON_APP_ID!"${MARATHON_APP_ID/\//}"!g" /etc/nginx/conf.d/default.conf

CONFIG_DIR=/var/lib/nginx/html/.well-known/${MARATHON_APP_ID/\//}/settings
mkdir -p $CONFIG_DIR
cat <<_EOF > $CONFIG_DIR/remote.txt
MARATHON_HOST=${MARATHON_HOST}
MARATHON_PORT=${MARATHON_PORT_22}
ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -N -R /var/run/localhost.sock:nginx:80 root@${MARATHON_HOST} -p${MARATHON_PORT_22}
_EOF

cat <<_EOF > $CONFIG_DIR/index.html
MARATHON_HOST=${MARATHON_HOST}
MARATHON_PORT=${MARATHON_PORT_22}
ssh -N -R /var/run/localhost.sock:nginx:80 root@${MARATHON_HOST} -p${MARATHON_PORT_22}
_EOF

/usr/sbin/php-fpm7
/usr/sbin/nginx -g "daemon off;"
