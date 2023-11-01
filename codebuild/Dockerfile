FROM debian:bookworm-slim
# FROM ubuntu:focal
#Ubuntu 22.04.2 LTS (Focal Fossa)

ARG TARGETPLATFORM

RUN apt-get update && apt-get upgrade && apt-get install -y sudo wget vim jq time curl unzip git
# https://releases.hashicorp.com/terraform/
# ARG TERRAFORM_VERSION="1.6.2"


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
  TERRAFORM_VERSION=`curl -s https://checkpoint-api.hashicorp.com/v1/check/terraform |jq -r .current_version` && \
  cd $HOME && \
  curl "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_${DOWNLOAD_ARCH}.zip" -o "$HOME/terraform.zip" && \
  unzip $HOME/terraform.zip && \
  sudo mv $HOME/terraform /usr/bin/ && \
  rm $HOME/terraform.zip
 
RUN \
  git clone --depth=1 https://github.com/tfutils/tfenv.git /usr/local/bin/tfenv && \
  echo "PATH=$PATH:/usr/local/bin/tfenv/bin/" >> /etc/profile 
  
RUN \
  source /etc/profile && \
  terraform --version && \
  tfenv use 1.5.0 && \
  terraform --version

