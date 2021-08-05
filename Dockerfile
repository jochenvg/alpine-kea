ARG ALPINE_VERSION=3.13

FROM alpine:$ALPINE_VERSION
RUN apk --no-cache add curl bash mariadb-client
RUN curl -1sLf 'https://dl.cloudsmith.io/public/isc/kea-1-9/setup.alpine.sh' | bash
RUN apk --no-cache add isc-kea isc-kea-admin isc-kea-hoos
COPY . /

ENTRYPOINT [ "/entrypoint.sh" ]
VOLUME /etc/kea /run/kea
EXPOSE 67/udp

