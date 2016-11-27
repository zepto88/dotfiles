# How to install
First backup or remove your existing dotfiles<br />
Now run the following commands:<br />

git init<br />
git remote add origin http://github.com/zepto88/dotfiles.git<br />
git fetch<br />
git checkout -t origin/master<br />
wget https://github.com/tpope/vim-pathogen/raw/master/autoload/pathogen.vim ~/.vim/autoload/<br />
git submodule update --init --recursive

My locker script is copied with a slight modification from https://github.com/guimeira/i3lock-fancy-multimonitor<br />

# MY DEPS
sudo apt install xorg build-essential lightdm-gtk-greeter i3 i3blocks lightdm git tig vim arandr mate-terminal fonts-noto-mono firefox compton apt-file software-properties-common tmux lightdm-gtk-greeter-settings lxappearance pavucontrol xautolock xbacklight scrot imagemagick gimp feh htop pkg-config automake pkgconf flashplugin-installer powerline <br />

# THEMEING
Font: Fonts for powerline<br />
 - https://github.com/powerline/fonts<br />
Font: FontAwesome<br />
 - https://github.com/FortAwesome/Font-Awesome<br />
 - http://fontawesome.io/cheatsheet/<br />
i3lock-blur<br /> 
 - https://github.com/karulont/i3lock-blur<br />
Ambience GTK Theme:<br />
 - sudo add-apt-repository ppa:ravefinity-project/ppa<br />
Numix Icons:<br />
 - Numix: sudo add-apt-repository ppa:numix/ppa<br />
Xcape <br />
 - xcape - https://github.com/alols/xcape.git
