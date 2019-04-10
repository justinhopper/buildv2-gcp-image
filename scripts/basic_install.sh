#!/bin/bash
set -e

echo "--- Add kubernetes repo"
sudo /bin/bash -c 'echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list'; echo "OK"

echo "--- Import kubernetes key"
sudo curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

echo "--- Add repo for docker"
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable"; echo "OK"

echo "--- Import docker key"
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo "--- Update package information"
sudo DEBIAN_FRONTEND=noninteractive apt update

echo "--- Install docker"
sudo DEBIAN_FRONTEND=noninteractive apt install -y docker-ce

echo "--- Install kubeadm, kubectl, kubelet"
sudo DEBIAN_FRONTEND=noninteractive apt install -y kubeadm=1.14.0-00 kubelet=1.14.0-00 kubectl=1.14.0-00
