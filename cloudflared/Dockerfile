FROM debian:bullseye-slim
# ARG CLOUDFLARED_URL_ARG
# ARG CLOUDFLARED_VERSION_ARG
# ARG CLOUDFLARED_ARCH_ARG
ARG TARGETPLATFORM

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y curl procps apt-utils

RUN \ 
  case ${TARGETPLATFORM} in \
    "linux/amd64")  DOWNLOAD_ARCH="amd64"  ;; \
    "linux/arm64") DOWNLOAD_ARCH="arm64"  ;; \
  esac && \
  curl --location -o /tmp/cloudflared.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-${DOWNLOAD_ARCH}.deb

RUN dpkg -i /tmp/cloudflared.deb
# LABEL org.opencontainers.image.source https://github.com/seangreathouse/cloudflared
ENTRYPOINT /usr/bin/cloudflared --pidfile /var/run/$name.pid --config /etc/cloudflared/config.yml tunnel run

# docker build -t cloudflared ./
# docker build -t ghcr.io/seangreathouse/cloudflared ./
# docker run --restart always -d -v /etc/cloudflared/sgreat_382:/etc/cloudflared --network host --name sgreat_382 cloudflared:latest
# docker run --restart always -d -v /etc/cloudflared/sgreat_full_tunnel_382:/etc/cloudflared --network host --name sgreat_full_tunnel_382 cloudflared:latest
# docker run --entrypoint /usr/bin/cloudflared cloudflared --version | :
# docker image tag cloudflared:latest ghcr.io/seangreathouse/cloudflared
# LABEL org.opencontainers.image.source https://github.com/OWNER/REPO
# docker run --restart always -d -v /etc/cloudflared/sgreat_382:/etc/cloudflared --network host --name sgreat_382_ghb ghcr.io/seangreathouse/cloudflared:main
