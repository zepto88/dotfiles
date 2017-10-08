#!/bin/bash

# MY CONFIG
function my_config(){
    user=$1
    ln -sf /usr/bin/vim.basic /etc/alternatives/editor

    read -p "Enter terminal you want to use: " input
    sudo -u $user echo "export TERMINAL=$input" >> ~/.profile

    read -p "Enter git name: " input
    sudo -u $user git config --global user.name "$input"
    read -p "Enter git mail: " input
    sudo -u $user git config --global user.email "$input"

    sudo -u $user git config --global push.default simple
}

#APT
function my_apt(){
    user=$1
    apt update
    apt install -y $(awk -F: '/ubuntu/ {print $2}' ~/README.md) debconf-utils

    #SHELL
    usermod -s $(which zsh) $user
    sudo -u $user touch ~/.zsh_aliases
}

#PPA
function my_ppa(){
    for ppa in $(awk -F' - ' '/ppa:/ {print $2}' ~/README.md)
    do
        add-apt-repository -y $ppa
    done

    apt update
    echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections

    apt install -y ambiance-flat-colors numix-icon-theme oracle-java8-installer
}

#GIT
function my_git(){
    user=$1
    repos=$2
    test -d $repos || sudo -u $1 mkdir $repos
    cd $repos

    for repo in $(awk -F' - ' '/.*\.git/ && !/dotfiles/ {print $2}' ~/README.md)
    do
        sudo -u $user git clone $repo
    done
}

#FANCY
function install_font_awesome(){
    repos=$1
    cd ${repos}
    mkdir -p ~/.local/share/fonts
    cp Font-Awesome/fonts/*.ttf ~/.local/share/fonts/
    fc-cache -fv
}

function install_i3lockblur(){
    repos=$1
    user=$2
    cd ${repos}/i3lock-blur
    apt install -y pkg-config libxcb1-dev libxcb1 libgl2ps-dev libx11-dev libglc0 libglc-dev libcairo2-dev libcairo-gobject2 libcairo2-dev libxkbfile-dev libxkbfile1 libxkbcommon-dev libxkbcommon-x11-dev libxcb-xkb-dev libxcb-dpms0-dev libxcb-damage0-dev libpam0g-dev libev-dev libxcb-image0-dev libxcb-util0-dev libxcb-composite0-dev libxcb-xinerama0-dev
    sudo -u $user make
    make install
}

function install_tmux(){
    repos=$1
    user=$2
    cd ${repos}/tmux
    apt install -y libevent-dev libncurses-dev
    sudo -u $user sh autogen.sh
    sudo -u $user ./configure
    sudo -u $user make 
    make install
}

function install_xcape(){
    repos=$1
    user=$2
    cd ${repos}/xcape
    apt install -y libxtst-dev
    sudo -u $user make
    make install
}

### SCRIPT STARTS HERE ###

user=${SUDO_USER}
repos=~/repos

my_config $user
my_apt $user
my_ppa
my_git $user $repos

install_font_awesome $repos
install_i3lockblur $repos $user
install_tmux $repos $user
install_xcape $repos $user
