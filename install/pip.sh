#!/bin/bash
if test ! $(which pip)
then
    curl -kL https://bootstrap.pypa.io/get-pip.py | python
fi
sudo pip install -U pip
sudo pip install ansible
sudo pip install ansible-lint
sudo pip install django
sudo pip install elpy
sudo pip install numpy
sudo pip install pandas
sudo pip install pgcli
sudo pip install pip-tools
sudo pip install scipy
sudo pip install tweepy
sudo pip install virtualenv
sudo pip install virtualenvwrapper

wget https://mecab.googlecode.com/files/mecab-python-0.996.tar.gz
sudo pip install mecab-python-0.996.tar.gz
rm -f ~/dotfiles/mecab-python-0.996.tar.gz

git clone https://github.com/amueller/word_cloud
cd word_cloud
sudo python setup.py install
rm -rf ~/dotfiles/word_cloud

pip freeze
# pip freeze > requirements.txt
# pip install -r requirements.txt
