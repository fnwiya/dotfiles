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
pip install openpyxl
# pip freeze > requirements.txt
# pip install -r requirements.txt
