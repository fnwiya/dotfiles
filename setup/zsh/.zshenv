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

if [ -e $HOME/.nvm ] ;then
  export NVM_ROOT="$HOME/.nvm"
  # source $HOME/.nvm/nvm.sh
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
fi

if which npm > /dev/null ;then
  export NODE_PATH=`npm root -g`
  export PATH=`npm bin -g`:$PATH
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

if [ -d /usr/local/java ] ;then
  export PATH="/usr/local/java/bin:$PATH"
fi

if [ -d ~/flutter/bin ] ;then
  export PATH="$HOME/flutter/bin:$PATH"
fi


if [ -d $HOME/Library/Android/sdk ] ;then
  export ANDROID_HOME="$HOME/Library/Android/sdk"
fi

# if [ -e /usr/libexec/java_home ] ; then
  # export JAVA_HOME=`/usr/libexec/java_home -v "1.8"`
# fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [ -d ~/.local/bin ] ; then
  export PATH="$HOME/.local/bin:$PATH"
fi

# if [ "`docker-machine status default`" = "Running" ]; then
#   eval $(docker-machine env default) >>/dev/null
# fi

if [ -e /opt/homebrew/bin/brew ] ; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if [ -e /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc ] ; then
  source /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
  source /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc
fi

