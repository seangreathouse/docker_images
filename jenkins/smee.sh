#!/bin/bash

# install in /usrt/local/bin
# export SMEE_URL="https://smee.io/1234567890"
# export SMEE_TOKEN="foo"
# smee.sh $SMEE_URL $SMEE_TOKEN
# docker run --env SMEE_URL=$SMEE_URL SMEE_TOKEN=$SMEE_TOKEN -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home ghcr.io/seangreathouse/docker_images/jenkins
# Generic Webhook Path
smee --url $1 --path /generic-webhook-trigger/invoke?token=$2 --port 8080 >> /var/log/smee.log 2>&1 &