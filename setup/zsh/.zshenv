typeset -U path PATH
path=(
   /usr/local/bin(N-/)
   /usr/local/sbin(N-/)
   /usr/bin(N-/)
   /bin(N-/)
   $path
)

if [ -e $HOME/bin/restartWeb.sh ] ; then
  export PATH="$HOME/bin:$PATH"
fi

# for go lang
if [ -d /usr/local/go ]; then
  export PATH="/usr/local/go/bin:$PATH"
  export GOPATH=$HOME/go
  export PATH="$GOPATH/bin:$PATH"
fi

# rbenv
if [ -e $HOME/.rbenv ] ;then
    export PATH="$HOME/.rbenv/bin:$PATH"
    if which rbenv > /dev/null; then
        eval "$(rbenv init -)";
    fi
fi

# pyenv
if [ -e $HOME/.pyenv ] ;then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

if [ -e /usr/local/etc/profile.d/z.sh ] ;then
  export PATH="/usr/local/etc/profile.d:$PATH"
fi

# psql
if [ -d /usr/local/pgsql ] ;then
  export PATH="/usr/local/pgsql/bin:$PATH"
fi

if [ -e $HOME/.tmuxinator/tmuxinator.zsh ] ; then
  autoload -Uz compinit
  compinit
  source $HOME/.tmuxinator/tmuxinator.zsh
fi

if [ -d ~/.cargo/bin ] ;then
  export PATH="$HOME/.cargo/bin:$PATH"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [ -d ~/.local/bin ] ; then
  export PATH="$HOME/.local/bin:$PATH"
fi
