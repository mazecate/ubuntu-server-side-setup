#!/bin/bash

install_mongodb_4_2() {
    # 更新包列表
    sudo apt-get update

    # 安裝必要的包
    sudo apt-get install -y gnupg

    # 添加 MongoDB 的 GPG 密鑰
    wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -

    # 創建 MongoDB 的源列表文件
    echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu $(lsb_release -cs)/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list

    # 更新包列表
    sudo apt-get update

    # 安裝 MongoDB 4.2
    sudo apt-get install -y mongodb-org

    # 啟動 MongoDB 服務
    sudo systemctl start mongod

    # 設置 MongoDB 服務開機自啟
    sudo systemctl enable mongod

    echo "MongoDB 4.2 安裝完成並已啟動。"
}

# 執行安裝函數
install_mongodb_4_2
