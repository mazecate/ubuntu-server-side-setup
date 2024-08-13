#!/bin/bash

# stop the script if any command fails
set -e

function install_nvm() {
  # Update packages and Upgrade system
  echo "Updating System.."
  sudo apt-get update -y
  
  # Installing prerequisites
  echo "Installing prerequisites..."
  sudo apt-get install -y build-essential checkinstall libssl-dev curl git gedit
  
  # Install NVM
  echo "Installing NVM..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
  
  # Source the current shell
  # Reference: https://unix.stackexchange.com/questions/184508/nvm-command-not-available-in-bash-script
  echo "Sourcing the current shell..."
  #source ~/.bashrc
  . ~/.nvm/nvm.sh
  . ~/.bashrc
  # export NVM_DIR="$HOME/.nvm"
  # [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  # [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
  
  # Install Node.js version 16.20.1
  echo "Installing Node.js LTS version..."
  nvm install --lts
  
  # Open new terminal
  gnome-terminal
  
  echo "Nvm installation completed successfully."
}

function install_mongo_shell() {
  # Install gnupg and its required libraries using the following command
  sudo apt-get install gnupg
  
  # Import the public key used by the package management system
  wget -qO- https://www.mongodb.org/static/pgp/server-7.0.asc | sudo tee /etc/apt/trusted.gpg.d/server-7.0.asc
  
  # Create a list file for MongoDB
  echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
  
  # Reload local package database
  sudo apt-get update
  
  # Install the latest stable version of mongosh with the included OpenSSL libraries:
  sudo apt-get install -y mongodb-mongosh

  echo "mongo shell installation completed successfully."
  mongosh --version
}

function install_robo3t() {
  # Update packages and Upgrade system
  echo "Updating System..."
  sudo apt-get update -y
  
  # Install Robo3t
  echo "Installing Robo3T..."
  wget https://github.com/Studio3T/robomongo/releases/download/v1.4.4/robo3t-1.4.4-linux-x86_64-e6ac9ec.tar.gz
  tar -xvzf robo3t-1.4.4-linux-x86_64-e6ac9ec.tar.gz
  sudo chmod +x robo3t-1.4.4-linux-x86_64-e6ac9ec/bin/robo3t
  
  sudo mkdir -p /usr/local/robo3t
  sudo cp -rf robo3t-1.4.4-linux-x86_64-e6ac9ec/* /usr/local/robo3t
  # sudo chmod +x /usr/local/bin/robo3t/bin/robo3t
  sudo ln -sf /usr/local/robo3t/bin/robo3t /usr/local/bin/robo3t
  
  # Open new terminal
  # gnome-terminal
  
  echo "Robo3T installation completed successfully."
  robo3t --version
}

function install_docker() {
  # Update the package index
  sudo apt-get update
  
  # Install packages to allow apt to use a repository over HTTPS
  sudo apt-get install -y \
      apt-transport-https \
      ca-certificates \
      curl \
      gnupg \
      lsb-release
  
  # Add Docker's official GPG key
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
  
  # Set up the stable Docker repository
  echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  
  # Update the package index again
  sudo apt-get update
  
  # Install Docker Engine, containerd, and Docker Compose
  sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
  
  # Verify the Docker installation
  echo "Docker installation completed successfully."
  sudo docker version
}

function install_docker_compose() {
  # Find suitable version number
  # https://github.com/docker/compose/releases?page=2
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
}

install_nvm
install_mongo_shell
install_robo3t
install_docker
install_docker_compose
