#!/bin/bash
sudo apt-get -y update
sudo apt-get -y upgrade
# develop-tool
sudo apt-get install ansible
sudo apt-get install build-essential
sudo apt-get install cmigemo
sudo apt-get install curl
sudo apt-get install elixir
sudo apt-get install fish
sudo apt-get install gcc
sudo apt-get install git
sudo apt-get install guake
sudo apt-get install global
sudo apt-get install golang
sudo apt-get install leiningen
sudo apt-get install pgadmin3
sudo apt-get install sqlite3
sudo apt-get install tmux
sudo apt-get install tortoisehg
sudo apt-get install tree
sudo apt-get install wget
sudo apt-get install z
sudo apt-get install zsh
# python
sudo apt-get install python-matplotlib
sudo apt-get install python-numpy
sudo apt-get install python-pip
sudo apt-get install python-setuptools
sudo apt-get install python-scipy
sudo apt-get install python-virtualenv

# others
sudo apt-get install dropbox
sudo apt-get install shutter

wget -O google-webdesigner_amd64.deb https://dl.google.com/linux/direct/google-webdesigner_current_amd64.deb
sudo dpkg -i google-webdesigner_amd64.deb
rm google-webdesigner_amd64.deb

sudo apt-get clean
sudo apt-get autoremove
