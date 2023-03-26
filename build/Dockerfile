# Smallest base image
FROM alpine:3.17.2

RUN echo "http://dl-cdn.alpinelinux.org/alpine/v3.17/main" >> /etc/apk/repositories && \
    apk add --update iptables bash

CMD exec /bin/bash -c "trap : TERM INT; sleep infinity & wait"
