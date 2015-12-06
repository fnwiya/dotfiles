#!/bin/bash
if test ! $(which pip)
then
    curl -kL https://raw.github.com/pypa/pip/master/contrib/get-pip.py | python
fi
pip install -U pip
pip install virtualenv
pip install virtualenvwrapper
pip install django
pip install pandas
pip install nose
pip install numpy
if [ "$(uname)" == "Darwin" ]; then
    brew install gfortran
fi
pip install scipy
pip install tweepy
pip install twitter
pip install xlrd
pip install xlwt
pip install xlutils
pip install openpyxl
pip install epc
pip install jedi
pip install elpy
pip install rope
pip install pip-tools
pip install pillow
pip install beautifulsoup4
pip install image
pip install pyinstaller
pip install zenhan
pip install tornado
pip install facebook-sdk

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
