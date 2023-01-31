## https://github.com/gersilex/apcupsd-docker
FROM alpine:latest

RUN apk update && apk add --no-cache apcupsd

# ADD apcupsd.conf /etc/apcupsd/apcupsd.conf
# ADD doshutdown /etc/apcupsd/doshutdown

VOLUME [ "/etc/apcupsd", "/var/log/apcupsd" ]

LABEL org.opencontainers.image.source https://github.com/seangreathouse/docker_images/apcupsd
# CMD [ "/sbin/apcupsd", "-b" ]
ENTRYPOINT [ "/sbin/apcupsd", "-b" ]
