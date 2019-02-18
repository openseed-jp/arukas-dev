#!/bin/sh

env > /root/docker.env

# setup sshd
ssh-keygen -A
ssh-keygen -f /root/.ssh/id_rsa -C root -N ''  >/dev/null
cat /root/.ssh/id_rsa.pub > /root/.ssh/authorized_keys
echo $AUTHORIZED_KEYS >> /root/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys

/usr/sbin/sshd -e -D
