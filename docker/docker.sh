#!/bin/env bash

source "$DOT/functions.sh"
set -xeo pipefail

# https://docs.docker.com/engine/install/fedora/
if [ $distrib == 'fedora' ]; then
  sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
  sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-compose
fi

sudo systemctl enable docker.service
sudo systemctl start docker.service

sudo usermod -aG docker $(whoami)
newgrp docker
