#!/bin/bash
curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun

sudo sh -eux <<EOF
# Install newuidmap & newgidmap binaries
apt-get install -y uidmap
EOF

dockerd-rootless-setuptool.sh install

# sudo bash -c "cat <<EOF >> /home/$USER/.bashrc
# export DOCKER_HOST=unix:///run/user/1000/docker.sock
# EOF"

# export DOCKER_HOST=unix:///run/user/1000/docker.sock

sudo tee -a ~/.bashrc <<-'EOF'

# 设置 DOCKER_HOST
export DOCKER_HOST=unix:///run/user/1000/docker.sock
EOF
exec bash


sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://dxjrwa8b.mirror.aliyuncs.com"],
  "insecure-registries" : ["localhost:32000"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker
