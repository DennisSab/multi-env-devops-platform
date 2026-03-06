#!/bin/bash
set -euxo pipefail

# Update packages
apt-get update -y

# Install prerequisites
apt-get install -y \
  ca-certificates \
  curl \
  gnupg \
  lsb-release

# Add Docker’s official GPG key
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg

# Add Docker repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
  > /etc/apt/sources.list.d/docker.list

apt-get update -y

# Install Docker Engine + Compose plugin
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Enable Docker on boot + start now
systemctl enable docker
systemctl start docker

# Allow ubuntu user to run docker without sudo
usermod -aG docker ubuntu

# Basic sanity output
docker --version
docker compose version