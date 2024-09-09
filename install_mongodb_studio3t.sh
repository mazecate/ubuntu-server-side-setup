#!/bin/bash

#https://github.com/mazecate/ubuntu-server-side-setup/edit/main/install_mongodb_studio3t.sh

install_mongodb() {
    # 更新包列表
    sudo apt-get update

    # 安裝必要的包
    sudo apt-get install -y gnupg curl

    # 添加 MongoDB 的 GPG 密鑰
    # wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
    curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
   --dearmor

    # 創建 MongoDB 的源列表文件
    # echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu $(lsb_release -cs)/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
    echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list

    # 更新包列表
    sudo apt-get update

    # 安裝 MongoDB stable software pacakge
    sudo apt-get install -y mongodb-org

    # 啟動 MongoDB 服務
    sudo systemctl start mongod

    # 設置 MongoDB 服務開機自啟
    sudo systemctl enable mongod

    echo "MongoDB 安裝完成並已啟動。"
}

# Function to install Studio 3T
install_studio3t() {
    # Download Studio 3T
    curl -L -o studio-3t-linux-x64.tar.gz https://download.studio3t.com/studio-3t/linux/2024.3.1/studio-3t-linux-x64.tar.gz

    # Extract the tar file
    tar -xzf studio-3t-linux-x64.tar.gz

    # Run the Studio 3T installer
    cd studio-3t-linux-x64
    sudo ./studio-3t-linux-x64.sh

    # Clean up
    cd ..
    rm -rf studio-3t-linux-x64.tar.gz studio-3t-linux-x64

    echo "Studio 3T installation completed!"
}

# 執行安裝函數
install_mongodb
install_studio3t
