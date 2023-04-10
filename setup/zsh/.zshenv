typeset -U path PATH
path=(
   /usr/local/bin(N-/)
   /usr/local/sbin(N-/)
   /usr/bin(N-/)
   /bin(N-/)
   $path
)

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

if [ -e $HOME/.nvm ] ;then
  export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
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

if [ -d /opt/homebrew/opt/openjdk ] ;then
  export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
fi


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [ -d ~/.local/bin ] ; then
  export PATH="$HOME/.local/bin:$PATH"
fi


if [ -e /opt/homebrew/bin/brew ] ; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if [ -e /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc ] ; then
  source /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
  source /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc
fi

