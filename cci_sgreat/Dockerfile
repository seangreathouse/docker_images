FROM cimg/base:current 
#Ubuntu 22.04.2 LTS (Focal Fossa)
# https://releases.hashicorp.com/terraform/
ARG TARGETPLATFORM
ARG TERRAFORM_VERSION="1.4.6"

RUN \ 
  case ${TARGETPLATFORM} in \
    "linux/amd64")  DOWNLOAD_ARCH="x86_64"  ;; \
    "linux/arm64") DOWNLOAD_ARCH="aarch64"  ;; \
  esac && \
  curl "https://awscli.amazonaws.com/awscli-exe-linux-${DOWNLOAD_ARCH}.zip" -o "awscliv2.zip" && \
  unzip awscliv2.zip && \
  sudo ./aws/install && \
  rm -rf awscliv2.zip aws
RUN \
  case ${TARGETPLATFORM} in \
    "linux/amd64")  DOWNLOAD_ARCH="amd64"  ;; \
    "linux/arm64") DOWNLOAD_ARCH="arm64"  ;; \
  esac && \
  curl "https://releases.hashicorp.com/terraform/1.4.6/terraform_${TERRAFORM_VERSION}_linux_${DOWNLOAD_ARCH}.zip" -o "terraform.zip" && \
  unzip terraform.zip && \
  cp terraform /usr/bin && \
  rm -rf terraform.zip terraform