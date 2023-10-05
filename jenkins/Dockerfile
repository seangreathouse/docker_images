FROM jenkins/jenkins
USER root

ARG TARGETPLATFORM
# https://releases.hashicorp.com/terraform/
ARG TERRAFORM_VERSION="1.5.7"

RUN cat /etc/issue

RUN apt-get update && apt-get install -y gnupg software-properties-common lsb-release sudo wget vim jq time nodejs npm

RUN apt-get install -y docker.io
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

RUN git clone --depth=1 https://github.com/tfutils/tfenv.git /usr/local/bin/tfenv
RUN echo "PATH=$PATH:/usr/local/bin/tfenv/bin/" >> /etc/profile

RUN npm install --global smee-client
COPY smee.sh /usr/local/bin/smee.sh
RUN chmod +x /usr/local/bin/smee.sh
COPY smee.service /etc/systemd/system/smee.service
RUN systemctl enable smee.service


# install aws cli
# install jq

# https://octopus.com/blog/jenkins-docker-install-guide
# docker run -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home sgreat/jenkins
# docker build --progress=plain -t sgreat/jenkins ./
# docker exec -it eager_swartz bash 
# docker run -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock -v $(which docker):$(which docker) ghcr.io/seangreathouse/docker_images/jenkins

# export SMEE_URL=https://smee.io/1234567890
# docker run --env SMEE_URL=$SMEE_URL -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home ghcr.io/seangreathouse/docker_images/jenkins