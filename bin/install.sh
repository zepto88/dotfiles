#!/bin/bash

#APT
apt update 
yes | apt install $(awk -F: '/ubuntu/ {print $2}')

#PYTHON
pip3 install powerline-status

#GIT
mkdir ~/repos
cd ~/repos

for git in $(awk -F- '/.*\.git/ && !/dotfiles/ {print $2}' README.md)
do
    git clone $git
done

#PPA
for ppa in $(awk -F- '/ppa:/ {print $2}' README.md)
do
    yes | add-apt-repository $ppa
done

apt update
yes | apt install ambiance-flat-colors numix-icon-theme oracle-java8-installer

