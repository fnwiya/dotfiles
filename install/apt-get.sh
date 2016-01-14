#!/bin/bash
sudo apt-get update
sudo apt-get upgrade
# develop-tool
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

# perl
sudo apt-get install lib{anyevent,class-accessor-lite,crypt-ssleay,datetime,dbd-sqlite3,dbd-mysql,dbd-pg,dbi,dbix-class,extutils-parsexs,file-homedir,file-sharedir,file-spec,ipc-run3,json,module-build,module-install,mojolicious,moo,moose,mouse,net-ssleay,path-class,plack,test-exception,test-fatal,test-requires,test-warnings,tie-ixhash,try-tiny,uri,uri-encode,www,xml-libxml,yaml}-perl

# others
sudo apt-get install dropbox
sudo apt-get install shutter

sudo apt-get clean
sudo apt-get autoremove
