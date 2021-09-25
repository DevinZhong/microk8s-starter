#!/bin/bash

microk8s.helm3 repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
microk8s.helm3 repo update
microk8s.helm3 install ingress-nginx ingress-nginx/ingress-nginx

docker pull jettech/kube-webhook-certgen:v1.5.2
docker tag jettech/kube-webhook-certgen:v1.5.2 k8s.gcr.io/ingress-nginx/kube-webhook-certgen:v1.0@sha256:f3b6b39a6062328c095337b4cadcefd1612348fdd5190b1dcbcb9b9e90bd8068
docker save k8s.gcr.io/ingress-nginx/kube-webhook-certgen:v1.0@sha256:f3b6b39a6062328c095337b4cadcefd1612348fdd5190b1dcbcb9b9e90bd8068 > kube-webhook-certgen.tar
microk8s ctr image import kube-webhook-certgen.tar
