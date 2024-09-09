#!/bin/bash

install_mongodb() {
    # 更新包列表
    sudo apt-get update

    # 安裝必要的包
    sudo apt-get install -y gnupg curl

    # 添加 MongoDB 的 GPG 密鑰
    curl -fsSL https://pgp.mongodb.com/server-4.2.asc | \
       sudo gpg -o /usr/share/keyrings/mongodb-server-4.2.gpg \
       --dearmor

    # 創建 MongoDB 的源列表文件
    echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu $(lsb_release -cs)/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
    #echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list

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

# 執行安裝函數
install_mongodb
