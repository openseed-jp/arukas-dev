FROM alpine:3.6

WORKDIR /root

RUN apk --no-cache add openssh-server 

COPY ./entrypoint.sh /root/entrypoint.sh
COPY ./entrypoint-sshd.sh /root/entrypoint-sshd.sh

EXPOSE 22
ENTRYPOINT [ "/root/entrypoint.sh" ]
