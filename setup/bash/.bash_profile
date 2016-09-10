if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

PATH=(
   /usr/local/bin:
   $HOME/bin
   /bin:
   /usr/bin:
   /usr/local/sbin:
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
fi
# pyenv
if [ -e $HOME/.pyenv ] ;then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
fi
# virtualenv
if [ -x "`which virtualenvwrapper.sh`" ] ;then
  export PATH=/usr/local/bin:$PATH
  mkdir -p "$HOME/.virtualenvs"
  export WORKON_HOME=$HOME/.virtualenvs
  source /usr/local/bin/virtualenvwrapper.sh
fi

if [ -e /usr/local/etc/profile.d/z.sh ] ;then
  export PATH="/usr/local/etc/profile.d:$PATH"
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export $PATH:PATH
