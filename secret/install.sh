#!/bin/bash

kubectl apply -f https://winter-glitter.devinzhong.workers.dev/DevinZhong/microk8s-starter/main/secret/nginx-tls-secret.yaml
kubectl apply -f https://winter-glitter.devinzhong.workers.dev/DevinZhong/microk8s-starter/main/secret/dashboard-tls-secret.yaml

