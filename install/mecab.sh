brew install mecab mecab-ipadic
wget https://mecab.googlecode.com/files/mecab-python-0.996.tar.gz
tar -zxvf mecab-python-0.996.tar.gz
cd mecab-python-0.996
vim setup.py
#def cmd2(str):
#    return string.split (cmd1(str))
##を以下に変更
#def cmd2(str):
#    return cmd1(str).split()
export CFLAGS=-Qunused-arguments
export CPPFLAGS=-Qunused-arguments
python setup.py build
pip install -e .
pip freeze
