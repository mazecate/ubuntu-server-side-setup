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

# To verify that the installation was successful, you can run:
docker-compose --version
