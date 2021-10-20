#!/bin/bash

# 需要准备好 crt 和 key 文件于 ./secret 目录

# 手动拉取 k8s.gcr.io/ingress-nginx/controller:v1.0.0-alpha.2
docker pull registry.cn-guangzhou.aliyuncs.com/devin-k8s-gcr-io/ingress-nginx-controller:1.0.0-alpha.2
docker tag registry.cn-guangzhou.aliyuncs.com/devin-k8s-gcr-io/ingress-nginx-controller:1.0.0-alpha.2 k8s.gcr.io/ingress-nginx/controller:v1.0.0-alpha.2
docker save k8s.gcr.io/ingress-nginx/controller:v1.0.0-alpha.2 > ingress-nginx-controller.tar

newgrp microk8s << EOF
microk8s.ctr image import ingress-nginx-controller.tar
microk8s.enable ingress
EOF
