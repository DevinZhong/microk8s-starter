#!/bin/bash

# 直接运行本脚本
# curl -SL https://raw.githubusercontent.com/DevinZhong/microk8s-starter/main/setup.sh | /bin/bash

sudo bash -c "echo \"$(curl -s https://websites.ipaddress.com/raw.githubusercontent.com | grep -E -o '([0-9]{1,3}\.){3}[0-9]{1,3}' | sort -r | head -n 1)  raw.githubusercontent.com\" >> /etc/hosts"

curl -SL https://raw.githubusercontent.com/DevinZhong/microk8s-starter/main/install_snap.sh | /bin/bash
source ~/.bashrc
curl -SL https://raw.githubusercontent.com/DevinZhong/microk8s-starter/main/install_docker.sh | /bin/bash
source ~/.bashrc
curl -SL https://raw.githubusercontent.com/DevinZhong/microk8s-starter/main/install_microk8s.sh | /bin/bash
