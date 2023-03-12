#!/bin/bash

# fetch and run docker convenience script
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

# add ubuntu user to docker group to allow cli access without sudo
usermod -aG docker ubuntu
