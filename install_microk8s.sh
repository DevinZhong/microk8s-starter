#!/bin/bash
sudo snap install microk8s --classic
sudo snap alias microk8s.kubectl kubectl
sudo usermod -a -G microk8s $USER
sudo chown -f -R $USER ~/.kube
newgrp microk8s

docker pull registry.cn-hangzhou.aliyuncs.com/google_containers/pause:3.1
docker tag registry.cn-hangzhou.aliyuncs.com/google_containers/pause:3.1 k8s.gcr.io/pause:3.1
docker save k8s.gcr.io/pause:3.1 > pause.tar
microk8s ctr image import pause.tar

# microk8s.enable dns ingress dashboard

# 删除
# sudo snap remove microk8s