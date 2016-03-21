!/usr/bin/env bash

# Install base tools
sudo apt-get update
sudo apt-get install -y git
sudo apt-get install -y wget
sudo apt-get install -y python-pip
sudo apt-get install -y python-dev

# Download liberty stable devstack
git clone -b stable/liberty https://github.com/openstack-dev/devstack.git
cd devstack
wget https://raw.githubusercontent.com/openstack/tacker/master/devstack/samples/local.conf.example

mv local.conf.example local.conf

# Replace Host IP
sed -i '/HOST_IP/ c HOST_IP=192.168.56.201' local.conf

# Do the stacking
./stack.sh
