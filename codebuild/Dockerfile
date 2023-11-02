FROM debian:bookworm-slim

ARG TARGETPLATFORM

RUN apt-get update && apt-get upgrade && apt-get dist-upgrade && \
    apt-get install -y sudo wget vim jq time curl unzip git && \
    rm -rf /var/lib/apt/lists/*

## AWS CLI v2
RUN \ 
  case ${TARGETPLATFORM} in \
    "linux/amd64")  DOWNLOAD_ARCH="x86_64"  ;; \
    "linux/arm64") DOWNLOAD_ARCH="aarch64"  ;; \
  esac && \
  cd $HOME && \
  curl "https://awscli.amazonaws.com/awscli-exe-linux-${DOWNLOAD_ARCH}.zip" -o "$HOME/awscliv2.zip" && \
  unzip $HOME/awscliv2.zip && \
  sudo $HOME/aws/install && \
  rm -rf $HOME/awscliv2.zip aws
 
RUN \
  git clone --depth=1 https://github.com/tfutils/tfenv.git /usr/local/bin/.tfenv && \
  ln -s /usr/local/bin/.tfenv/bin/* /usr/local/bin/ && \
  echo 'trust-tfenv: yes' > /usr/local/bin/.tfenv/use-gpgv && \
  TERRAFORM_VERSION=`curl -s https://checkpoint-api.hashicorp.com/v1/check/terraform |jq -r .current_version` && \
  tfenv use ${TERRAFORM_VERSION} 


