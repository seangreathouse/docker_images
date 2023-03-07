FROM debian:bullseye-slim
# ARG CLOUDFLARED_URL_ARG
# ARG CLOUDFLARED_VERSION_ARG
# ARG CLOUDFLARED_ARCH_ARG
ARG TARGETPLATFORM

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y curl procps apt-utils haveged wget ca-certificates apt-transport-https gnupg

# Install Java 8
RUN wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | sudo apt-key add -
RUN echo "deb https://adoptopenjdk.jfrog.io/adoptopenjdk/deb bullseye main" | sudo tee /etc/apt/sources.list.d/adoptopenjdk.list
RUN sudo apt-get update && sudo apt-get install adoptopenjdk-8-hotspot

# Install MongoDB repo
RUN echo "deb http://repo.mongodb.org/apt/debian stretch/mongodb-org/3.6 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.6.list
RUN wget -qO - https://www.mongodb.org/static/pgp/server-3.6.asc | sudo apt-key add -

# Install Unifi Controller
RUN echo 'deb https://www.ui.com/downloads/unifi/debian stable ubiquiti' | sudo tee /etc/apt/sources.list.d/100-ubnt-unifi.list
RUN wget -O /etc/apt/trusted.gpg.d/unifi-repo.gpg https://dl.ubnt.com/unifi/unifi-repo.gpg
RUN apt-get update; apt-get install unifi -y

ENTRYPOINT /usr/bin/cloudflared --pidfile /var/run/$name.pid --config /etc/cloudflared/config.yml tunnel run

# docker build -t cloudflared ./
# docker build -t ghcr.io/seangreathouse/cloudflared ./
# docker run --restart always -d -v /etc/cloudflared/sgreat_382:/etc/cloudflared --network host --name sgreat_382 cloudflared:latest
# docker run --restart always -d -v /etc/cloudflared/sgreat_full_tunnel_382:/etc/cloudflared --network host --name sgreat_full_tunnel_382 cloudflared:latest
# docker run --entrypoint /usr/bin/cloudflared cloudflared --version | :
# docker image tag cloudflared:latest ghcr.io/seangreathouse/cloudflared
# LABEL org.opencontainers.image.source https://github.com/OWNER/REPO
# docker run --restart always -d -v /etc/cloudflared/sgreat_382:/etc/cloudflared --network host --name sgreat_382_ghb ghcr.io/seangreathouse/cloudflared:main
