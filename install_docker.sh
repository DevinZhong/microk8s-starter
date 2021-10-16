#!/bin/bash

# step 1: 安装必要的一些系统工具
sudo apt-get update
sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common
# step 2: 安装GPG证书
curl -fsSL http://mirrors.aliyun.com/docker-ce/linux/ubuntu/gpg | sudo apt-key add -
# Step 3: 写入软件源信息
sudo add-apt-repository "deb [arch=amd64] http://mirrors.aliyun.com/docker-ce/linux/ubuntu $(lsb_release -cs) stable"
# Step 4: 更新并安装 Docker-CE
sudo apt-get -y update
sudo apt-get -y install docker-ce

# 权限设置
sudo sh -eux <<EOF
# Install newuidmap & newgidmap binaries
apt-get install -y uidmap
EOF
dockerd-rootless-setuptool.sh install
sudo tee -a ~/.bashrc <<-'EOF'

# 设置 DOCKER_HOST
export DOCKER_HOST=unix:///run/user/1000/docker.sock
EOF
source ~/.bashrc

# sudo usermod -aG docker $USER
# newgrp docker

# 使用阿里镜像加速器
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://dxjrwa8b.mirror.aliyuncs.com"],
  "insecure-registries" : ["localhost:32000"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker
