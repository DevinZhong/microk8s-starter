#!/bin/bash

# 运行当前脚本
# source <(curl -SL https://winter-glitter.devinzhong.workers.dev/DevinZhong/microk8s-starter/main/secret/install.sh)

kubectl apply -f https://winter-glitter.devinzhong.workers.dev/DevinZhong/microk8s-starter/main/secret/nginx-tls-secret.yaml
kubectl apply -f https://winter-glitter.devinzhong.workers.dev/DevinZhong/microk8s-starter/main/secret/dashboard-tls-secret.yaml

