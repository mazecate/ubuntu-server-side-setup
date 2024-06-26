#!/bin/bash

# stop the script if any command fails
set -e

# Update packages and Upgrade system
echo "Updating System.."
sudo apt-get update -y

# Installing prerequisites
echo "Installing prerequisites..."
sudo apt-get install -y build-essential checkinstall libssl-dev curl git

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
echo "Installing Node.js version 16.20.1..."
nvm install --lts

# Install Robo3t
echo "Installing Robo3T..."
wget https://github.com/Studio3T/robomongo/releases/download/v1.4.4/robo3t-1.4.4-linux-x86_64-e6ac9ec.tar.gz
tar -xvzf robo3t-1.4.4-linux-x86_64-e6ac9ec.tar.gz

# New method
# sudo mkdir /usr/local/bin/old_robo3t
# sudo mv /usr/local/bin/robo3t /usr/local/bin/old_robo3t
# # sudo mkdir /usr/local/bin/robo3t
# sudo mv robo3t-1.4.4-linux-x86_64-e6ac9ec/* /usr/local/robo3t
# sudo chmod +x /usr/local/bin/robo3t/bin/robo3t
# sudo ln -sf /usr/local/robo3t/bin/robo3t /usr/local/bin/robo3t

# Open new terminal
gnome-terminal

# Kill current terminal by pid
# pid=$$
# kill -9 $pid

echo "Installation completed successfully."

################################################################################################################################################
# Using apt-get install jq:
# sudo apt-get update
# sudo apt-get -y install jq

# Using apt install jq:
# sudo apt update
# sudo apt -y install jq

# Check jq version
# jq --version

# Autp get the latest nvm version tag
# LATEST_NVM_VERSION=$(curl -s https://api.github.com/repos/nvm-sh/nvm/releases/latest | jq -r '.tag_name')
# echo "Latest nvm version: $LATEST_NVM_VERSION"
# echo curl -s https://raw.githubusercontent.com/nvm-sh/nvm/$LATEST_NVM_VERSION/install.sh
