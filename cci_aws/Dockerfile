FROM cimg/base:current 
#Ubuntu 22.04.2 LTS (Focal Fossa)
ARG TARGETPLATFORM

RUN \ 
  case ${TARGETPLATFORM} in \
    "linux/amd64")  DOWNLOAD_ARCH="x86_64"  ;; \
    "linux/arm64") DOWNLOAD_ARCH="arm64"  ;; \
  esac && \
  # curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
  curl "https://awscli.amazonaws.com/awscli-exe-linux-${DOWNLOAD_ARCH}.zip" -o "awscliv2.zip" && \
  unzip awscliv2.zip && \
  sudo ./aws/install && \
  rm -rf awscliv2.zip aws


# RUN aws --version

# docker build -t cloudflared ./
# docker build -t ghcr.io/seangreathouse/cloudflared ./
# docker run --restart always -d -v /etc/cloudflared/sgreat_382:/etc/cloudflared --network host --name sgreat_382 cloudflared:latest
# docker run --restart always -d -v /etc/cloudflared/sgreat_full_tunnel_382:/etc/cloudflared --network host --name sgreat_full_tunnel_382 cloudflared:latest
# docker run --entrypoint /usr/bin/cloudflared cloudflared --version | :
# docker image tag cloudflared:latest ghcr.io/seangreathouse/cloudflared
# LABEL org.opencontainers.image.source https://github.com/OWNER/REPO
# docker run --restart always -d -v /etc/cloudflared/sgreat_382:/etc/cloudflared --network host --name sgreat_382_ghb ghcr.io/seangreathouse/cloudflared:main

