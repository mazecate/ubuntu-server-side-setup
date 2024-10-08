#!/bin/bash

# stop the script if any command fails
set -e

# Update packages and Upgrade system
echo "Updating System.."
sudo apt-get update -y

# Installing prerequisites
echo "Installing prerequisites..."
sudo apt-get install -y build-essential checkinstall libssl-dev curl git gedit

# Install NVM
echo "Installing NVM..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash

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

echo "Installation completed successfully."
