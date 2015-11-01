#!/bin/bash
#if test ! $(which pip)
#then
#    curl -kL https://raw.github.com/pypa/pip/master/contrib/get-pip.py | python
#fi
pip install -U pip
pip install virtualenv virtualenvwrapper django pandas

# pip freeze > requirements.txt
# pip install -r requirements.txt
