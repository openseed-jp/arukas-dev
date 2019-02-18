#!/bin/sh

sed -i -e "s!\$MARATHON_APP_ID!"${MARATHON_APP_ID/\//}"!g" /etc/nginx/conf.location.d/tty-location.conf 

TERM=xterm SHELL=/bin/bash /usr/local/bin/gotty /usr/bin/tmux -u new -A -s console
