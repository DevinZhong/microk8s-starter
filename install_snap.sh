#!/bin/bash

# 安装 snap
sudo apt-get update
sudo apt-get install snapd

# 设置环境变量
PATH=$PATH:/snap/bin
sudo bash -c "cat <<EOF > /etc/environment
PATH=\"$PATH\"
EOF"
