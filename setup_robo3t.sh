#!/bin/bash

# stop the script if any command fails
set -e

# Update packages and Upgrade system
echo "Updating System..."
sudo apt-get update -y

# Install Robo3t
echo "Installing Robo3T..."
wget https://github.com/Studio3T/robomongo/releases/download/v1.4.4/robo3t-1.4.4-linux-x86_64-e6ac9ec.tar.gz
tar -xvzf robo3t-1.4.4-linux-x86_64-e6ac9ec.tar.gz
sudo chmod +x robo3t-1.4.4-linux-x86_64-e6ac9ec/bin/robo3t

# New method
# sudo mkdir /usr/local/bin/old_robo3t
# sudo mv /usr/local/bin/robo3t /usr/local/bin/old_robo3t
# # sudo mkdir /usr/local/bin/robo3t
# sudo mv robo3t-1.4.4-linux-x86_64-e6ac9ec/* /usr/local/robo3t
# sudo chmod +x /usr/local/bin/robo3t/bin/robo3t
# sudo ln -sf /usr/local/robo3t/bin/robo3t /usr/local/bin/robo3t

# Open new terminal
# gnome-terminal

echo "Robo3T installation completed successfully."
