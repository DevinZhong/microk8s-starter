#!/bin/bash

# 修改hostname
CURRENT_HOSTNAME=$(hostname)
NEW_HOSTNAME="way2hacker.com"
sudo tee /etc/hostname <<-EOF
$NEW_HOSTNAME
EOF
sudo sed -i "s/$CURRENT_HOSTNAME/$NEW_HOSTNAME/g" /etc/hosts
sudo hostname $NEW_HOSTNAME
exec bash

# 安装 microk8s
sudo snap install microk8s --classic
sudo snap alias microk8s.kubectl kubectl
sudo usermod -a -G microk8s $USER
sudo chown -f -R $USER ~/.kube
exec bash

# 手动拉取 k8s.gcr.io/pause:3.1
newgrp docker
docker pull registry.cn-hangzhou.aliyuncs.com/google_containers/pause:3.1
docker tag registry.cn-hangzhou.aliyuncs.com/google_containers/pause:3.1 k8s.gcr.io/pause:3.1
docker save k8s.gcr.io/pause:3.1 > pause.tar
newgrp microk8s
microk8s ctr image import pause.tar

# microk8s.enable dns ingress dashboard

# docker pull bitnami/metrics-server:0.5.0
# docker tag bitnami/metrics-server:0.5.0 k8s.gcr.io/metrics-server/metrics-server:v0.5.0
# docker save k8s.gcr.io/metrics-server/metrics-server:v0.5.0 > metrics-server.tar
# newgrp microk8s
# microk8s ctr image import metrics-server.tar

# 删除
# sudo snap remove microk8s

# 查看日志
# sudo snap logs -f microk8s