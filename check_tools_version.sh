#!/bin/bash

# Check Docker version
docker --version

# Check Docker Compose version
docker-compose --version

# Check Robo 3T version (if installed via snap)
# snap info robo3t-snap
robo3t --version

# Check Node.js version using NVM
nvm --version
nvm ls

# Check Node.js version (if installed via apt)
node --version

# Check MongoDB shell version
mongo --version

####
# This is for details show
####
# #!/bin/bash

# # Check if Docker is installed
# if command -v docker &>/dev/null; then
#     echo "Docker is installed"
#     docker --version
# else
#     echo "Docker is not installed"
# fi
# echo

# # Check if Docker Compose is installed
# if command -v docker-compose &>/dev/null; then
#     echo "Docker Compose is installed"
#     docker-compose --version
# else
#     echo "Docker Compose is not installed"
# fi
# echo

# # Check if Robo 3T (via snap) is installed
# if snap list | grep -q robo3t-snap; then
#     echo "Robo 3T is installed"
#     snap info robo3t-snap
# else
#     echo "Robo 3T is not installed"
# fi
# echo

# # Check if NVM is installed
# if command -v nvm &>/dev/null; then
#     echo "NVM is installed"
#     nvm --version
#     nvm ls
# else
#     echo "NVM is not installed"
# fi
# echo

# # Check if Node.js is installed (via apt)
# if command -v node &>/dev/null; then
#     echo "Node.js is installed"
#     node --version
# else
#     echo "Node.js is not installed"
# fi
# echo

# # Check if MongoDB shell is installed
# if command -v mongo &>/dev/null; then
#     echo "MongoDB shell is installed"
#     mongo --version
# else
#     echo "MongoDB shell is not installed"
# fi
# echo
