#!/bin/bash
if test ! $(which pip)
then
    curl -kL https://raw.github.com/pypa/pip/master/contrib/get-pip.py | python
fi
pip install -U pip
pip install ansible
pip install ansible-lint
pip install django
pip install elpy
pip install numpy
pip install pandas
pip install pip-tools
pip install scipy
pip install tweepy
pip install virtualenv
pip install virtualenvwrapper

wget https://mecab.googlecode.com/files/mecab-python-0.996.tar.gz
pip install mecab-python-0.996.tar.gz
rm -f ~/dotfiles/mecab-python-0.996.tar.gz

git clone https://github.com/amueller/word_cloud
cd word_cloud
python setup.py install
rm -rf ~/dotfiles/word_cloud

pip freeze
# pip freeze > requirements.txt
# pip install -r requirements.txt
