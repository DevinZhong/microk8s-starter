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

# 手动拉取 k8s.gcr.io/pause:3.1
docker pull registry.cn-hangzhou.aliyuncs.com/google_containers/pause:3.1
docker tag registry.cn-hangzhou.aliyuncs.com/google_containers/pause:3.1 k8s.gcr.io/pause:3.1
docker save k8s.gcr.io/pause:3.1 > pause.tar

# 手动拉取 k8s.gcr.io/ingress-nginx/controller:v1.0.0-alpha.2
docker pull registry.cn-guangzhou.aliyuncs.com/devin-k8s-gcr-io/ingress-nginx-controller:1.0.0-alpha.2
docker tag registry.cn-guangzhou.aliyuncs.com/devin-k8s-gcr-io/ingress-nginx-controller:1.0.0-alpha.2 k8s.gcr.io/ingress-nginx/controller:v1.0.0-alpha.2
docker save k8s.gcr.io/ingress-nginx/controller:v1.0.0-alpha.2 > ingress-nginx-controller.tar

# 手动拉取 k8s.gcr.io/metrics-server/metrics-server:v0.5.0
docker pull registry.cn-guangzhou.aliyuncs.com/devin-k8s-gcr-io/metrics-server:0.5.0
docker tag registry.cn-guangzhou.aliyuncs.com/devin-k8s-gcr-io/metrics-server:0.5.0 k8s.gcr.io/metrics-server/metrics-server:v0.5.0
docker save k8s.gcr.io/metrics-server/metrics-server:v0.5.0 > metrics-server.tar

newgrp microk8s << EOF
microk8s.ctr image import pause.tar
microk8s.ctr image import ingress-nginx-controller.tar
microk8s.ctr image import metrics-server.tar
microk8s.enable dns ingress dashboard
kubectl port-forward -n kube-system service/kubernetes-dashboard 10443:443 --address 0.0.0.0
EOF

# 删除
# sudo snap remove microk8s

# 查看日志
# sudo snap logs -f microk8s