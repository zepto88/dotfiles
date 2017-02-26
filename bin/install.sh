#!/bin/bash

#APT
apt update 
apt install -y $(awk -F: '/ubuntu/ {print $2}' ~/README.md) debconf-utils

#PYTHON
pip3 install powerline-status

#PPA
for ppa in $(awk -F' - ' '/ppa:/ {print $2}' ~/README.md)
do
    add-apt-repository -y $ppa
done

apt update
echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
apt install -y ambiance-flat-colors numix-icon-theme oracle-java8-installer

#GIT
user=$(who am i | awk '{print $1}')
su $user
mkdir ~/repos
cd ~/repos

for git in $(awk -F' - ' '/.*\.git/ && !/dotfiles/ {print $2}' ~/README.md)
do
    git clone $git
done

