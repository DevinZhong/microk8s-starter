#!/bin/bash

kubectl apply -f https://winter-glitter.devinzhong.workers.dev/DevinZhong/microk8s-starter/main/frps/config-map.yaml
kubectl apply -f https://winter-glitter.devinzhong.workers.dev/DevinZhong/microk8s-starter/main/frps/deployment.yaml
kubectl apply -f https://winter-glitter.devinzhong.workers.dev/DevinZhong/microk8s-starter/main/frps/service.yaml
kubectl apply -f https://winter-glitter.devinzhong.workers.dev/DevinZhong/microk8s-starter/main/frps/ingress.yaml

kubectl patch configmap nginx-ingress-tcp-microk8s-conf --patch "$(curl https://winter-glitter.devinzhong.workers.dev/DevinZhong/microk8s-starter/main/frps/patch/nginx-ingress-tcp-microk8s-conf.yaml)" -n ingress
kubectl patch daemonset nginx-ingress-microk8s-controller --patch "$(curl https://winter-glitter.devinzhong.workers.dev/DevinZhong/microk8s-starter/main/frps/patch/nginx-ingress-microk8s-controller.yaml)" -n ingress
