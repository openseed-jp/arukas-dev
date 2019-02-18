#!/bin/sh

/root/entrypoint-gotty.sh &
/root/entrypoint-nginx.sh &
/root/entrypoint-sshd.sh

