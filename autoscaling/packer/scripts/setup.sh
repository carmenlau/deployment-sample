#!/bin/sh

set -e

# Docker installation: https://docs.docker.com/install/linux/docker-ce/ubuntu/
apt-get update
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io
usermod -a -G docker ubuntu

# Install docker-compose
curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Install aws-cfn-bootstrap
apt-get install -y python-pip
pip install pyopenssl ndg-httpsclient pyasn1
pip install https://s3.amazonaws.com/cloudformation-examples/aws-cfn-bootstrap-latest.tar.gz
