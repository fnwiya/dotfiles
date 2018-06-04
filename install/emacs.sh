VERSION=26.1
cd /usr/local/src
sudo wget http://ftp.gnu.org/pub/gnu/emacs/emacs-${VERSION}.tar.gz
sudo tar zxvf emacs-${VERSION}.tar.gz
cd emacs-${VERSION}
sudo ./configure --with-gnutls=no
sudo make
sudo make install
