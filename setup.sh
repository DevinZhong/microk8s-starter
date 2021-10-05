#!/bin/bash

# 直接运行本脚本
# curl -SL https://raw.githubusercontent.com/DevinZhong/microk8s-starter/main/setup.sh | sh

curl -SL https://raw.githubusercontent.com/DevinZhong/microk8s-starter/main/install_snap.sh | sh
source ~/.bashrc
curl -SL https://raw.githubusercontent.com/DevinZhong/microk8s-starter/main/install_docker.sh | sh
source ~/.bashrc
curl -SL https://raw.githubusercontent.com/DevinZhong/microk8s-starter/main/install_microk8s.sh | sh
