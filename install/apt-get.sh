#!/bin/bash
sudo apt-get -y update
sudo apt-get -y upgrade
# develop-tool
sudo apt-get -y install ansible
sudo apt-get -y install autojump
sudo apt-get -y install build-essential
sudo apt-get -y install cmigemo
sudo apt-get -y install curl
sudo apt-get -y install elixir
sudo apt-get -y install emacs
sudo apt-get -y install fish
sudo apt-get -y install gcc
sudo apt-get -y install git
sudo add-apt-repository ppa:git-core/ppa
sudo apt-get -y update
sudo apt-get -y install guake
sudo apt-get -y install global
sudo apt-get -y install golang
sudo apt-get -y install leiningen
sudo apt-get -y install libpoppler-glib-dev # for https://github.com/politza/pdf-tools
sudo apt-get -y install lv
sudo apt-get -y install markdown
sudo apt-get -y install multitail
sudo apt-get -y install nodejs
sudo apt-get -y install npm
sudo update-alternatives --install /usr/bin/node node /usr/bin/nodejs 10
sudo apt-get -y install pgadmin3
sudo apt-get -y install silversearcher-ag
sudo apt-get -y install sqlite3
sudo apt-get -y install ssh
sudo apt-get -y install thg
sudo apt-get -y install tmux
sudo add-apt-repository ppa:tortoisehg-ppa/releases
sudo apt-get -y update
sudo apt-get -y install tortoisehg
sudo apt-get -y install tree
sudo apt-get -y install wget
sudo apt-get -y install z
sudo apt-get -y install zsh
# hub
sudo apt-get -y install ruby
sudo curl https://hub.github.com/standalone -Lo /usr/bin/hub
sudo chmod 755 /usr/bin/hub
# python
sudo apt-get -y install python-matplotlib
sudo apt-get -y install python-setuptools

# others
sudo apt-get -y install nautilus-dropbox
sudo apt-get -y install gimp
sudo apt-get -y install inkscape
sudo apt-get -y install shutter

sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y clean
sudo apt-get -y autoremove

curl -L https://raw.github.com/simonwhitaker/gibo/master/gibo \
    -so ~/bin/gibo && chmod +x ~/bin/gibo && gibo -u
