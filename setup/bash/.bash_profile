if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

export PATH=/usr/local/bin:$HOME/bin:/bin:/usr/bin:/usr/local/sbin
# for go lang
if [ -d /usr/local/go ]; then
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

if [ -e /usr/local/etc/profile.d/z.sh ] ;then
  export PATH="/usr/local/etc/profile.d:$PATH"
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

if [ -e $HOME/.cargo/bin ] ;then
    export PATH="$HOME/.cargo/bin:$PATH"
fi

export PATH="$HOME/.cargo/bin:$PATH"
