typeset -U path PATH
path=(
   /bin(N-/)
   /usr/bin(N-/)
   /usr/local/sbin(N-/)
   /Library/Frameworks/Python.framework/Versions/3.4/bin(N-/)
   $path
)
# for go lang
if [ -x "`which go`" ]; then
  export GOROOT=`which go`
  export GOPATH=$HOME/go
  export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
fi

# rbenv
if [ -e $HOME/.rbenv ] ;then
  export PATH="$HOME/.rbenv/bin:$PATH"
fi
# pyenv
if [ -e $HOME/.pyenv ] ;then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
fi
# virtualenv
if [ -x "`which virtualenvwrapper.sh`" ] ;then
  mkdir -p "$HOME/.virtualenvs"
  source /usr/local/bin/virtualenvwrapper.sh
  export WORKON_HOME=$HOME/.virtualenvs
fi

if [ -e /usr/local/etc/profile.d/z.sh ] ;then
  export PATH="/usr/local/etc/profile.d:$PATH"
fi

export PATH="/usr/local/bin:$PATH"
