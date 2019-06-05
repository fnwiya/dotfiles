if test ! $(which pyenv)
then
  curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash
fi
pyenv install 2.7.10
pyenv install 3.6.4
pyenv global 3.6.4
