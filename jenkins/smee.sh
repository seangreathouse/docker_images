#!/bin/bash

# install in /usrt/local/bin
smee --url $1 --path /github-webhook/ --port 8080 >> /var/log/smee.log 2>&1 &