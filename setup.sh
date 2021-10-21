#!/bin/bash

# 直接运行本脚本
# source <(curl -SL https://raw.githubusercontent.com/DevinZhong/microk8s-starter/main/setup.sh)
# 添加 host 后，可执行以下命令
# source <(curl -SL https://winter-glitter.devinzhong.workers.dev/DevinZhong/microk8s-starter/main/setup.sh)


# sudo bash -c "echo \"$(curl -s https://websites.ipaddress.com/raw.githubusercontent.com | grep -E -o '([0-9]{1,3}\.){3}[0-9]{1,3}' | sort -r | head -n 1)  raw.githubusercontent.com\" >> /etc/hosts"
sudo tee -a /etc/hosts <<-'EOF'

# cloudflare 地址
104.19.28.207 winter-glitter.devinzhong.workers.dev
104.19.28.207 floral-dream.devinzhong.workers.dev
EOF

source <(curl -SL https://winter-glitter.devinzhong.workers.dev/DevinZhong/microk8s-starter/main/install_snap.sh)
source <(curl -SL https://winter-glitter.devinzhong.workers.dev/DevinZhong/microk8s-starter/main/install_docker.sh)
source <(curl -SL https://winter-glitter.devinzhong.workers.dev/DevinZhong/microk8s-starter/main/install_microk8s.sh)
source <(curl -SL https://winter-glitter.devinzhong.workers.dev/DevinZhong/microk8s-starter/main/enable_ingress.sh)
