FROM jenkins/jenkins
USER root

ARG TARGETPLATFORM
# https://releases.hashicorp.com/terraform/
ARG TERRAFORM_VERSION="1.5.4"

RUN cat /etc/issue

RUN apt-get update && apt-get install -y gnupg software-properties-common lsb-release sudo wget vim jq docker.io

RUN sudo usermod -a -G docker jenkins

## AWS CLI v2
RUN \ 
  case ${TARGETPLATFORM} in \
    "linux/amd64")  DOWNLOAD_ARCH="x86_64"  ;; \
    "linux/arm64") DOWNLOAD_ARCH="aarch64"  ;; \
  esac && \
  curl "https://awscli.amazonaws.com/awscli-exe-linux-${DOWNLOAD_ARCH}.zip" -o "awscliv2.zip" && \
  unzip awscliv2.zip && \
  sudo ./aws/install && \
  rm -rf awscliv2.zip aws

## Terraform
RUN \
  case ${TARGETPLATFORM} in \
    "linux/amd64")  DOWNLOAD_ARCH="amd64"  ;; \
    "linux/arm64") DOWNLOAD_ARCH="arm64"  ;; \
  esac && \
  curl "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_${DOWNLOAD_ARCH}.zip" -o "terraform.zip" && \
  unzip terraform.zip && \
  sudo mv terraform /usr/bin/ && \
  rm terraform.zip

# install aws cli
# install jq

# https://octopus.com/blog/jenkins-docker-install-guide
# docker run -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home sgreat/jenkins
# docker build --progress=plain -t sgreat/jenkins ./
# docker exec -it eager_swartz bash 