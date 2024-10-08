#!/bin/bash

# stop the script if any command fails
set -e

# Reference 
# https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-20-04


# Find suitable version number
# https://github.com/docker/compose/releases?page=2
# versionNumber=1.29.2
versionNumber=v2.27.2

sudo curl -L "https://github.com/docker/compose/releases/download/${versionNumber}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Next, set the correct permissions so that the docker-compose command is executable:
sudo chmod +x /usr/local/bin/docker-compose

# Create docker group if not exist
sudo groupadd docker

# Add your user to the docker group (optional, to run Docker without sudo)
sudo usermod -aG docker $USER

# Login to the new `docker` group (to avoid having to logout / login again; but if not enough, try to reboot):
newgrp docker

# To verify that the installation was successful, you can run:
docker-compose --version
