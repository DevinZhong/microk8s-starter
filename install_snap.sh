#!/bin/bash

# 安装 snap
sudo apt-get update
sudo apt-get install snapd

sudo tee -a ~/.bashrc <<-'EOF'

# 把 /snap/bin 加入 PATH
[[ $PATH =~ "/snap/bin" ]] || PATH="$PATH:/snap/bin"
EOF
source ~/.bashrc

# 安装代理，不一定有用
sudo snap install snap-store
sudo snap install snap-store-proxy
sudo snap install snap-store-proxy-client