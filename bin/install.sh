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
test -d ~/repos || sudo -u $user mkdir ~/repos
cd ~/repos

for repo in $(awk -F' - ' '/.*\.git/ && !/dotfiles/ {print $2}' ~/README.md)
do
    sudo -u $user git clone $repo
done

#SHELL
usermod -s $(which zsh) $user

#FANCY
cd fonts
./install.sh
cd -
cp Font-Awesome/fonts/*.ttf ~/.local/share/fonts/


