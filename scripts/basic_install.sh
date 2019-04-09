#!/bin/bash
set -e

echo "--- Initial package update"
sudo apt-get update

echo "--- Install basic system tool packages"
sudo apt-get install -y apt-transport-https curl gnupg2 software-properties-common

echo "--- Add kubernetes repo"
sudo /bin/bash -c 'echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list'

echo "--- Import docker key"
sudo curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

echo "--- Add repo for docker"
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

echo "--- Update package information"
sudo apt update

echo "--- Install docker"
sudo apt install -y docker-ce