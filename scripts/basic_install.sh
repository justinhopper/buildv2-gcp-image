#!/bin/bash
set -e

echo "--- Initial package update"
sudo DEBIAN_FRONTEND=noninteractive apt-get update

echo "--- Install basic system tool packages"
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y apt-transport-https curl gnupg2 software-properties-common

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