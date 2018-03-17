cd /usr/local/src
sudo wget http://ftp.gnu.org/pub/gnu/emacs/emacs-25.3.tar.gz
sudo tar zxvf emacs-25.3.tar.gz
cd emacs-25.3
./configure --without-x
sudo make
sudo make install
