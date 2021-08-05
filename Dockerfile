ARG ALPINE_VERSION=3.14.0

FROM alpine:$ALPINE_VERSION

RUN apk --no-cache add kea kea-admin mariadb-client && \
    mkdir -p /run/kea

VOLUME /etc/kea
EXPOSE 67/udp

