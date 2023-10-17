#!/bin/bash

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
echo "Sourcing the current shell..."
#source ~/.bashrc
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Install Node.js version 16.20.1
echo "Installing Node.js version 16.20.1..."
nvm install 16.20.1

# Install Robo3Td
echo "Installing Robo3T..."
wget https://download.studio3t.com/robomongo/linux/robo3t-1.4.4-linux-x86_64-e6ac9ec.tar.gz
tar -xvzf robo3t-1.4.4-linux-x86_64-e6ac9ec.tar.gz
sudo mv robo3t-1.4.4-linux-x86_64-e6ac9ec.tar.gz /usr/local/bin/robo3t
sudo ln -s /usr/local/bin/robo3t/bin/robo3t /usr/local/bin/robo3t

echo "Installation completed successfully."


#Help me write a shell script, using in ubuntu 20.04, including install build-essential checkinstall libssl-dev nvm git curl package with "yes" and source the current shell and nvm install 16.20.1 and install robo3T and echo each process name
# https://github.com/Studio3T/robomongo
