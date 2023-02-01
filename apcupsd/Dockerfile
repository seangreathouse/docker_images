## https://github.com/gersilex/apcupsd-docker
FROM alpine:latest

RUN apk update && apk upgrade && apk add --no-cache apcupsd

VOLUME [ "/etc/apcupsd", "/var/log/apcupsd" ]

LABEL org.opencontainers.image.source https://github.com/seangreathouse/docker_images/apcupsd
LABEL docker_from alpine:latest

ENTRYPOINT [ "/sbin/apcupsd", "-b" ]
