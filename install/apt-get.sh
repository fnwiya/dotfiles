#!/bin/bash
sudo apt-get -y update
sudo apt-get -y upgrade
# add-repository
sudo add-apt-repository -y ppa:git-core/ppa
sudo add-apt-repository -y ppa:mattn/growl-for-linux
sudo apt-add-repository -y ppa:numix/ppa
sudo add-apt-repository -y ppa:tortoisehg-ppa/releases
sudo add-apt-repository -y ppa:snwh/pulp
#wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
#sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt-get -y update
# develop-tool
sudo apt-get -y install ansible
sudo apt-get -y install autojump
sudo apt-get -y install build-essential
sudo apt-get -y install cmigemo
sudo apt-get -y install curl
sudo apt-get -y install dmenu
sudo apt-get -y install elixir
sudo apt-get -y install emacs
sudo apt-get -y install fish
sudo apt-get -y install gcc
sudo apt-get -y install git
sudo apt-get -y install gcolor2
sudo apt-get -y install growl-for-linux
sudo apt-get -y install guake
sudo apt-get -y install global
sudo apt-get -y install gnome-tweak-tool
sudo apt-get -y install golang
sudo apt-get -y install jq
sudo apt-get -y install leiningen
sudo apt-get -y install libpoppler-glib-dev # for https://github.com/politza/pdf-tools
sudo apt-get -y install lv
sudo apt-get -y install markdown
sudo apt-get -y install multitail
sudo apt-get -y install nodejs
sudo apt-get -y install npm
sudo apt-get -y install numix-gtk-theme
sudo apt-get -y install numix-icon-theme-circle
sudo apt-get -y install paper-gtk-theme
sudo apt-get -y install paper-icon-theme
sudo apt-get -y install pgadmin3
sudo apt-get -y install ppa-purge
sudo apt-get -y install rxvt-unicode-256color
sudo apt-get -y install silversearcher-ag
sudo apt-get -y install sqlite3
sudo apt-get -y install ssh
sudo apt-get -y install stalonetray
sudo apt-get -y install thg
sudo apt-get -y install tmux
if [ ! -x /usr/local/bin/emojify ]; then 
  sudo apt-get -y install ttf-ancient-fonts
  sudo sh -c "curl https://raw.githubusercontent.com/mrowa44/emojify/master/emojify -o /usr/local/bin/emojify && chmod +x /usr/local/bin/emojify"
fi
sudo apt-get -y install tortoisehg
sudo apt-get -y install tree
sudo apt-get -y install unity-tweak-tool
sudo apt-get -y install wget
sudo apt-get -y install xmonad
sudo apt-get -y install xmobar
sudo apt-get -y install z
sudo apt-get -y install zsh
# ranger
sudo apt-get -y install ranger
sudo apt-get -y install w3m
sudo apt-get -y install lynx
sudo apt-get -y install highlight
sudo apt-get -y install atool
sudo apt-get -y install mediainfo
sudo apt-get -y install xpdf
sudo apt-get -y install caca-utils
ranger --copy-config=all
# hub
#sudo apt-get -y install ruby
#sudo curl https://hub.github.com/standalone -Lo /usr/bin/hub
#sudo chmod 755 /usr/bin/hub
# python
sudo apt-get -y install python-dev libpq-dev libevent-dev
sudo apt-get -y install python-pip
sudo apt-get -y install python-matplotlib
sudo apt-get -y install python-setuptools

# others
sudo apt-get -y install nautilus-dropbox
sudo apt-get -y install gimp
sudo apt-get -y install inkscape
sudo apt-get -y install shutter
sudo apt-get -y install mozc-utils-gui ibus-gtk3 ibus-mozc
#sudo apt-get -y install google-chrome-stable

if [ ! -e $HOME/emacs-24.5 ]; then 
  sudo apt-get build-dep emacs24
  cd $HOME
  wget -O- http://ftp.gnu.org/gnu/emacs/emacs-24.5.tar.xz | tar xJf -
  cd emacs-24.5
  ./configure
  make
  sudo make install
  cd $HOME
fi

sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y clean
sudo apt-get -y autoremove
