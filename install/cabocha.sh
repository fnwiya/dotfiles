#!/bin/sh

wget http://crfpp.googlecode.com/files/CRF%2B%2B-0.58.tar.gz
tar zvxf  CRF++-0.58.tar.gz
cd CRF++-0.58
./configure
make
sudo make install
cd ~

wget http://cabocha.googlecode.com/files/cabocha-0.67.tar.bz2
tar xjvf cabocha-0.67.tar.bz2
cd cabocha-0.67
./configure --with-charset=UTF8 --with-posset=IPA
make
sudo make install
