FROM debian:bookworm-slim
# FROM ubuntu:focal
#Ubuntu 22.04.2 LTS (Focal Fossa)

ARG TARGETPLATFORM
# https://releases.hashicorp.com/terraform/
ARG TERRAFORM_VERSION="1.6.2"

RUN apt-get update && apt-get upgrade && apt-get install -y sudo wget vim jq time curl unzip git


## AWS CLI v2
RUN \ 
  case ${TARGETPLATFORM} in \
    "linux/amd64")  DOWNLOAD_ARCH="x86_64"  ;; \
    "linux/arm64") DOWNLOAD_ARCH="aarch64"  ;; \
  esac && \
  cd $HOME && \
  curl "https://awscli.amazonaws.com/awscli-exe-linux-${DOWNLOAD_ARCH}.zip" -o "$HOME/awscliv2.zip" && \
  unzip $HOME/awscliv2.zip && \
  sudo $HOME//aws/install && \
  rm -rf $HOME/awscliv2.zip aws

## Terraform
RUN \
  case ${TARGETPLATFORM} in \
    "linux/amd64")  DOWNLOAD_ARCH="amd64"  ;; \
    "linux/arm64") DOWNLOAD_ARCH="arm64"  ;; \
  esac && \
  cd $HOME && \
  curl "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_${DOWNLOAD_ARCH}.zip" -o "$HOME/terraform.zip" && \
  unzip $HOME/terraform.zip && \
  sudo mv $HOME/terraform /usr/bin/ && \
  rm $HOME/terraform.zip
 
 

