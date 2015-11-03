#!/bin/bash
#if test ! $(which pip)
#then
#    curl -kL https://raw.github.com/pypa/pip/master/contrib/get-pip.py | python
#fi
pip install -U pip
pip install virtualenv
pip install virtualenvwrapper
pip install django
pip install pandas
pip install nose
pip install numpy
brew install gfortran
pip install scipy
pip install tweepy
pip install xlrd
pip install xlwt
pip install xlutils
pip install epc
pip install jedi
pip install elpy
pip install rope
pip install pip-tools


wget https://mecab.googlecode.com/files/mecab-python-0.996.tar.gz
pip install mecab-python-0.996.tar.gz

# pip freeze > requirements.txt
# pip install -r requirements.txt
