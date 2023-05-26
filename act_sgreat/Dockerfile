FROM summerwind/actions-runner:latest
#Ubuntu 22.04.2 LTS (Focal Fossa)

ARG TARGETPLATFORM
# https://releases.hashicorp.com/terraform/
ARG TERRAFORM_VERSION="1.4.6"
# https://github.com/helm/helm/releases
ARG HELM_VERSION="v3.12.0"

RUN echo "export KUBECTL_VERSION=`curl -L -s https://dl.k8s.io/release/stable.txt`" >> $HOME/envfile

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

## Kubectl
RUN . $HOME/envfile; \
  case ${TARGETPLATFORM} in \
    "linux/amd64")  DOWNLOAD_ARCH="amd64"  ;; \
    "linux/arm64") DOWNLOAD_ARCH="arm64"  ;; \
  esac && \
  curl -L "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/${DOWNLOAD_ARCH}/kubectl" -o "$HOME/kubectl" && \
  sudo install -o root -g root -m 0755 $HOME/kubectl /usr/local/bin/kubectl 

## Helm
RUN \
  cd $HOME && \
  case ${TARGETPLATFORM} in \
    "linux/amd64")  DOWNLOAD_ARCH="amd64"  ;; \
    "linux/arm64") DOWNLOAD_ARCH="arm64"  ;; \
  esac && \
  curl -L "https://get.helm.sh/helm-${HELM_VERSION}-linux-${DOWNLOAD_ARCH}.tar.gz" -o "$HOME/helm.tar.gz" && \
  tar -zxvf $HOME/helm.tar.gz && \
  sudo mv $HOME/linux-${DOWNLOAD_ARCH}/helm /usr/local/bin/helm
  # tar -zxvf helm-${HELM_VERSION}-linux-${DOWNLOAD_ARCH}.tar.gz && \

## Ansible
RUN \ 
  cd $HOME && \
  curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
  python3 get-pip.py --user && \
  python3 -m pip install --user ansible

## Kustomize
RUN \ 
  cd $HOME && \
  curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash && \
  sudo mv $HOME/kustomize /usr/local/bin/kustomize



