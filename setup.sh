#!/bin/bash
set -e

version="${1}"

if [[ "${version}" != v* ]]; then
  version="v${version}"
fi

echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/${version}/deb/ /" | sudo tee /etc/apt/sources.list.d/kubernetes.list
curl -fsSL "https://pkgs.k8s.io/core:/stable:/${version}/deb/Release.key" | sudo gpg --no-tty --batch --yes --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

sudo apt update
sudo apt -y --allow-downgrades install "kubectl=${version#v}.*"

kubectl version --client=true
