#!/bin/sh

## i fix the problem with docker and Docker compose en ubuntu 19.10 no LTS
#  Check the version what you want
CONTAINERD_VERSION="1.2.10-3"
DOCKER_CE_CLI_VERSION="19.03.3~3-0"
DOCKER_CE_VERSION="19.03.3~3-0"

echo "# DOWNLOAD THE DOCKER FILES"
wget "https://download.docker.com/linux/ubuntu/dists/disco/pool/stable/amd64/containerd.io_"$CONTAINERD_VERSION"_amd64.deb"
wget "https://download.docker.com/linux/ubuntu/dists/disco/pool/stable/amd64/docker-ce-cli_"$DOCKER_CE_CLI_VERSION"~ubuntu-disco_amd64.deb"
wget "https://download.docker.com/linux/ubuntu/dists/disco/pool/stable/amd64/docker-ce_"$DOCKER_CE_VERSION"~ubuntu-disco_amd64.deb"

echo "# INSTALL DOCKER DEPENDENCIES MANUALLY (NO UPDATES AFTER THIS)"
sudo dpkg -i "containerd.io_"$CONTAINERD_VERSION"_amd64.deb"
sudo dpkg -i "docker-ce-cli_"$DOCKER_CE_CLI_VERSION"~ubuntu-disco_amd64.deb"
sudo dpkg -i "docker-ce_"$DOCKER_CE_VERSION"~ubuntu-disco_amd64.deb"


