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
  export GOROOT=/usr/local/go
  export GOPATH=$HOME/go
  export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
fi

# rbenv
if [ -e $HOME/.rbenv ] ;then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi
# pyenv
if [ -e $HOME/.pyenv ] ;then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi
# virtualenv
if [ -e $HOME/.virtualenvs ] ;then
  export WORKON_HOME=$HOME/.virtualenvs
  export PROJECT_HOME=$HOME/Devel
  source /path/to/your/virtualenvwrapper.sh
fi

export PATH="/usr/local/bin:$PATH"
