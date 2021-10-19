#!/bin/bash

# 手动拉取 k8s.gcr.io/metrics-server/metrics-server:v0.5.0
docker pull registry.cn-guangzhou.aliyuncs.com/devin-k8s-gcr-io/metrics-server:0.5.0
docker tag registry.cn-guangzhou.aliyuncs.com/devin-k8s-gcr-io/metrics-server:0.5.0 k8s.gcr.io/metrics-server/metrics-server:v0.5.0
docker save k8s.gcr.io/metrics-server/metrics-server:v0.5.0 > metrics-server.tar

newgrp microk8s << EOF
microk8s.ctr image import metrics-server.tar
microk8s.enable dashboard
EOF

kubectl apply -f https://winter-glitter.devinzhong.workers.dev/DevinZhong/microk8s-starter/main/dashboard/dashboard-ingress.yaml

# 获取页面访问 token
# token=$(microk8s kubectl -n kube-system get secret | grep default-token | cut -d " " -f1)
# microk8s kubectl -n kube-system describe secret $token