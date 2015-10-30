typeset -U path PATH
export PATH="/usr/local/bin:$PATH"
path=(
   /bin(N-/)
   /usr/bin(N-/)
   /usr/local/bin(N-/)
   /usr/local/sbin(N-/)
   /Library/Frameworks/Python.framework/Versions/3.4/bin(N-/)
   $path
)
# nvm
[ -s $HOME/.nvm/nvm.sh ] && . $HOME/.nvm/nvm.sh

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
