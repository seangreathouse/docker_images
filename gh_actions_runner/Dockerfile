# base
FROM debian:bookworm-slim

# set the github runner version
# ARG GH_ACTIONS_RUNNER_CURRENT_VERSION="2.321.0"
ARG GH_ACTIONS_RUNNER_CURRENT_VERSION
ARG TARGETPLATFORM

# debug
RUN echo "GH_ACTIONS_RUNNER_CURRENT_VERSION: ${GH_ACTIONS_RUNNER_CURRENT_VERSION}"
RUN echo "TARGETPLATFORM: ${TARGETPLATFORM}"

# update the base packages and add a non-sudo user
RUN apt-get update -y && apt-get upgrade -y && useradd -m docker

# install python and the packages the your code depends on along with jq so we can parse JSON
# add additional packages as necessary
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    curl jq build-essential libssl-dev libffi-dev python3 python3-venv python3-dev python3-pip

# cd into the user directory, download and unzip the github actions runner
RUN cd /home/docker && mkdir actions-runner && cd actions-runner \
    && curl -O -L https://github.com/actions/runner/releases/download/v${GH_ACTIONS_RUNNER_CURRENT_VERSION}/actions-runner-linux-x64-${GH_ACTIONS_RUNNER_CURRENT_VERSION}.tar.gz \
    && tar xzf ./actions-runner-linux-x64-${GH_ACTIONS_RUNNER_CURRENT_VERSION}.tar.gz

RUN \ 
    case ${TARGETPLATFORM} in \
      "linux/amd64")  DOWNLOAD_ARCH="x64"  ;; \
      "linux/arm64") DOWNLOAD_ARCH="arm64"  ;; \
    esac && \
    cd /home/docker && mkdir actions-runner && cd actions-runner && \
    curl -O -L https://github.com/actions/runner/releases/download/v${GH_ACTIONS_RUNNER_CURRENT_VERSION}/actions-runner-linux-${DOWNLOAD_ARCH}-${GH_ACTIONS_RUNNER_CURRENT_VERSION}.tar.gz && \
    tar xzf ./actions-runner-linux-${DOWNLOAD_ARCH}-${GH_ACTIONS_RUNNER_CURRENT_VERSION}.tar.gz

# install some additional dependencies
RUN chown -R docker ~docker && /home/docker/actions-runner/bin/installdependencies.sh

# copy over the start.sh script
COPY start.sh start.sh

# make the script executable
RUN chmod +x start.sh

# since the config and run script for actions are not allowed to be run by root,
# set the user to "docker" so all subsequent commands are run as the docker user
USER docker

# set the entrypoint to the start.sh script
ENTRYPOINT ["./start.sh"]