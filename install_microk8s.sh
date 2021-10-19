#!/bin/bash

# 修改hostname
CURRENT_HOSTNAME=$(hostname)
NEW_HOSTNAME="way2hacker.com"
sudo tee /etc/hostname <<-EOF
$NEW_HOSTNAME
EOF
sudo sed -i "s/$CURRENT_HOSTNAME/$NEW_HOSTNAME/g" /etc/hosts
sudo hostname $NEW_HOSTNAME

# 安装 microk8s
sudo snap install microk8s --classic
sudo snap alias microk8s.kubectl kubectl
sudo usermod -a -G microk8s $USER
sudo chown -f -R $USER ~/.kube

sudo iptables -P FORWARD ACCEPT
echo iptables-persistent iptables-persistent/autosave_v4 boolean true | sudo debconf-set-selections
echo iptables-persistent iptables-persistent/autosave_v6 boolean true | sudo debconf-set-selections
sudo apt-get -y install iptables-persistent

# 手动拉取 k8s.gcr.io/pause:3.1
docker pull registry.cn-hangzhou.aliyuncs.com/google_containers/pause:3.1
docker tag registry.cn-hangzhou.aliyuncs.com/google_containers/pause:3.1 k8s.gcr.io/pause:3.1
docker save k8s.gcr.io/pause:3.1 > pause.tar

newgrp microk8s << EOF
microk8s.ctr image import pause.tar
EOF

# 删除
# sudo snap remove microk8s

# 查看日志
# sudo snap logs -f microk8s