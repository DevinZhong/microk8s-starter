#!/bin/bash

# 安装 snap
sudo apt-get update
sudo apt-get install snapd
snap --version
sudo apt autoremove -y

# 设置环境变量
# PATH=$PATH:/snap/bin
# sudo bash -c "cat <<EOF > /etc/environment
# PATH=\"$PATH\"
# EOF"

sudo tee -a ~/.bashrc <<-'EOF'

# 把 /snap/bin 加入 PATH
[[ $PATH =~ "/snap/bin" ]] || PATH="$PATH:/snap/bin"
EOF
exec bash

# sudo snap install snap-store-proxy snap-store-proxy-client
