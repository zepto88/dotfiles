#!/bin/bash
apt update && yes | apt install xorg build-essential lightdm-gtk-greeter i3 i3blocks lightdm git tig vim arandr rxvt-unicode-256color fonts-noto-mono firefox compton apt-file software-properties-common tmux lightdm-gtk-greeter-settings lxappearance pavucontrol xautolock xbacklight scrot imagemagick gimp feh htop pkg-config automake pkgconf flashplugin-installer powerline python-software-properties python3-pip xclip

yes | add-apt-repository ppa:ravefinity-project/ppa || echo "Could not add ravefinity ppa"; exit 1

yes | add-apt-repository ppa:numix/ppa || echo "Could not add numix ppa"; exit 1

apt update

yes | apt install ambiance numix
