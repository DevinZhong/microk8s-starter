#!/bin/bash
curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun

sudo sh -eux <<EOF
# Install newuidmap & newgidmap binaries
apt-get install -y uidmap
EOF

dockerd-rootless-setuptool.sh install

# export DOCKER_HOST=unix:///run/user/1001/docker.sock

sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://dxjrwa8b.mirror.aliyuncs.com"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker
