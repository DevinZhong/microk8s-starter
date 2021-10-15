#!/bin/bash

# 直接运行本脚本
# curl -SL https://raw.githubusercontent.com/DevinZhong/microk8s-starter/main/setup.sh | /bin/bash

# sudo bash -c "echo \"$(curl -s https://websites.ipaddress.com/raw.githubusercontent.com | grep -E -o '([0-9]{1,3}\.){3}[0-9]{1,3}' | sort -r | head -n 1)  raw.githubusercontent.com\" >> /etc/hosts"
# source ~/.bashrc
sudo tee -a /etc/hosts <<-'EOF'

# cloudflare 地址
104.19.28.207 winter-glitter.devinzhong.workers.dev
EOF

curl -SL https://winter-glitter.devinzhong.workers.dev/DevinZhong/microk8s-starter/main/install_snap.sh | /bin/bash
exec bash
curl -SL https://winter-glitter.devinzhong.workers.dev/DevinZhong/microk8s-starter/main/install_docker.sh | /bin/bash
exec bash
curl -SL https://winter-glitter.devinzhong.workers.dev/DevinZhong/microk8s-starter/main/install_microk8s.sh | /bin/bash
