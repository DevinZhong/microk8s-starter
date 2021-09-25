#!/usr/bin/env bash

set -e

# 手动添加的目录变量
SNAP=/snap/microk8s/2487
SNAP_DATA=/var/snap/microk8s/2487

source $SNAP/actions/common/utils.sh
CA_CERT=/snap/core18/current/etc/ssl/certs/ca-certificates.crt

echo "Enabling Helm 3"

if [ ! -f "${SNAP_DATA}/bin/helm3" ]
then
  # 更改为华为的源
  SOURCE_URI="https://mirrors.huaweicloud.com/helm/v3.5.0/"
#   SOURCE_URI="https://get.helm.sh"
  HELM_VERSION="v3.5.0"

  echo "Fetching helm version $HELM_VERSION."
  run_with_sudo mkdir -p "${SNAP_DATA}/tmp/helm"
  (cd "${SNAP_DATA}/tmp/helm"
  # $(arch)改成了amd64
  run_with_sudo "${SNAP}/usr/bin/curl" --cacert $CA_CERT -L $SOURCE_URI/helm-$HELM_VERSION-linux-amd64.tar.gz -o "$SNAP_DATA/tmp/helm/helm.tar.gz"
#   run_with_sudo "${SNAP}/usr/bin/curl" --cacert $CA_CERT -L $SOURCE_URI/helm-$HELM_VERSION-linux-$(arch).tar.gz -o "$SNAP_DATA/tmp/helm/helm.tar.gz"
  run_with_sudo gzip -f -d "$SNAP_DATA/tmp/helm/helm.tar.gz"
  run_with_sudo tar -xf "$SNAP_DATA/tmp/helm/helm.tar")

  run_with_sudo mkdir -p "$SNAP_DATA/bin/"
  run_with_sudo mv "$SNAP_DATA/tmp/helm/linux-$(arch)/helm" "$SNAP_DATA/bin/helm3"
  run_with_sudo chmod +x "$SNAP_DATA/bin/"
  run_with_sudo chmod +x "$SNAP_DATA/bin/helm3"

  run_with_sudo rm -rf "$SNAP_DATA/tmp/helm"
fi

echo "Helm 3 is enabled"
