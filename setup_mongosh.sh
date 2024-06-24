#!/bin/bash

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

# Install mongosh with your OpenSSL 1.1 libraries:
# sudo apt-get install -y mongodb-mongosh-shared-openssl11

# Install mongosh with your OpenSSL 3.0 libraries:
# sudo apt-get install -y mongodb-mongosh-shared-openssl3

# Check version
mongosh --version

# https://www.mongodb.com/docs/mongodb-shell/
# https://www.mongodb.com/docs/mongodb-shell/install/
# mongodb+srv://linus:<password>@cluster0.shfmedr.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0
