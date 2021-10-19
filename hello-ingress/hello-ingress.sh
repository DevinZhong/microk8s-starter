#!/bin/bash

# 手动拉取 gcr.io/google-samples/hello-app:1.0
docker pull registry.cn-guangzhou.aliyuncs.com/devin-k8s-gcr-io/google-samples-hello-app:1.0
docker tag registry.cn-guangzhou.aliyuncs.com/devin-k8s-gcr-io/google-samples-hello-app:1.0 gcr.io/google-samples/hello-app:1.0
docker save gcr.io/google-samples/hello-app:1.0 > hello-app-v1.tar
# 手动拉取 gcr.io/google-samples/hello-app:2.0
docker pull registry.cn-guangzhou.aliyuncs.com/devin-k8s-gcr-io/google-samples-hello-app:2.0
docker tag registry.cn-guangzhou.aliyuncs.com/devin-k8s-gcr-io/google-samples-hello-app:2.0 gcr.io/google-samples/hello-app:2.0
docker save gcr.io/google-samples/hello-app:2.0 > hello-app-v2.tar

newgrp microk8s << EOF
microk8s.ctr image import hello-app-v1.tar
microk8s.ctr image import hello-app-v2.tar
EOF

kubectl create deployment web --image=gcr.io/google-samples/hello-app:1.0
kubectl expose deployment web --type=NodePort --port=8080
kubectl create deployment web2 --image=gcr.io/google-samples/hello-app:2.0
kubectl expose deployment web2 --type=NodePort --port=8080

kubectl apply -f https://winter-glitter.devinzhong.workers.dev/DevinZhong/microk8s-starter/main/hello-ingress/hello-ingress.yaml
