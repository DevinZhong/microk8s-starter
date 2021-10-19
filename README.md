# microk8s-starter
Microk8s starter script base on Ubuntu 20.04 LTS

## How to use
```bash
# raw.githubusercontent.com 访问不太顺畅，一次下载不了，可能多试几次就好了
# install microk8s & enable ingress
source <(curl -SL https://raw.githubusercontent.com/DevinZhong/microk8s-starter/main/setup.sh)

# (optional) ingress example
source <(curl -SL https://raw.githubusercontent.com/DevinZhong/microk8s-starter/main/hello-ingress/hello-ingress.sh)

# (optional, dependent ingress) enable dashboard
source <(curl -SL https://raw.githubusercontent.com/DevinZhong/microk8s-starter/main/dashboard/enable_dashbaord.sh)
```