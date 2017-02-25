#!/bin/bash
apt update && yes | apt install $(awk -F: '/ubuntu/ {print $2}')

yes | add-apt-repository ppa:ravefinity-project/ppa || (echo "Could not add ravefinity ppa"; exit 1)

yes | add-apt-repository ppa:numix/ppa || (echo "Could not add numix ppa"; exit 1)

apt update

yes | apt install ambiance-flat-colors numix-icon-theme

sudo pip3 install powerline
