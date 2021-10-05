#!/bin/bash

# 直接运行本脚本
# curl -SL https://raw.githubusercontent.com/DevinZhong/microk8s-starter/main/setup.sh | /bin/bash

curl -SL https://raw.githubusercontent.com/DevinZhong/microk8s-starter/main/install_snap.sh | /bin/bash
source ~/.bashrc
curl -SL https://raw.githubusercontent.com/DevinZhong/microk8s-starter/main/install_docker.sh | /bin/bash
source ~/.bashrc
curl -SL https://raw.githubusercontent.com/DevinZhong/microk8s-starter/main/install_microk8s.sh | /bin/bash
