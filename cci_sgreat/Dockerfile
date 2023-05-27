FROM cimg/base:current 
#Ubuntu 22.04.2 LTS (Focal Fossa)

ARG TARGETPLATFORM
# https://releases.hashicorp.com/terraform/
ARG TERRAFORM_VERSION="1.4.6"
# https://github.com/helm/helm/releases
ARG HELM_VERSION="v3.12.0"

RUN echo "export KUBECTL_VERSION=`curl -L -s https://dl.k8s.io/release/stable.txt`" >> ./envfile

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

## Kubectl
RUN . ./envfile; \
  case ${TARGETPLATFORM} in \
    "linux/amd64")  DOWNLOAD_ARCH="amd64"  ;; \
    "linux/arm64") DOWNLOAD_ARCH="arm64"  ;; \
  esac && \
  curl -LO "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/${DOWNLOAD_ARCH}/kubectl" && \
  sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl 

## Helm
RUN \
  case ${TARGETPLATFORM} in \
    "linux/amd64")  DOWNLOAD_ARCH="amd64"  ;; \
    "linux/arm64") DOWNLOAD_ARCH="arm64"  ;; \
  esac && \
  curl -LO "https://get.helm.sh/helm-${HELM_VERSION}-linux-${DOWNLOAD_ARCH}.tar.gz" && \
  tar -zxvf helm-${HELM_VERSION}-linux-${DOWNLOAD_ARCH}.tar.gz && \
  sudo mv linux-${DOWNLOAD_ARCH}/helm /usr/local/bin/helm

## Ansible
RUN \ 
  curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
  python3 get-pip.py --user && \
  python3 -m pip install --user ansible

## Kustomize
RUN \ 
  curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash && \
  sudo mv ./kustomize /usr/local/bin/kustomize

RUN sudo rm -rf /home/circleci/project/*

