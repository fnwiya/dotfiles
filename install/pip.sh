#!/bin/bash
if test ! $(which pip)
then
    curl -kL https://bootstrap.pypa.io/get-pip.py | python
fi
sudo pip install -U pip
sudo pip install ansible
sudo pip install ansible-lint
sudo pip install autopep8
sudo pip install beautifulsoup4
sudo pip install django
sudo pip install elpy
sudo pip install Mako
sudo pip install numpy
sudo pip install pandas
sudo pip install pep8
sudo pip install pgcli
sudo pip install pip-tools
sudo pip install scipy
sudo pip install tweepy
sudo pip install virtualenv
sudo pip install virtualenvwrapper

# git clone https://github.com/amueller/word_cloud
# cd word_cloud
# sudo python setup.py install
# sudo rm -rf ~/dotfiles/word_cloud

# pip freeze > requirements.txt
# pip install -r requirements.txt
