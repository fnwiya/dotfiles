export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# emacsの設定
alias E="TERM=xterm-256color /Applications/Emacs.app/Contents/MacOS/Emacs"
alias emacs="TERM=xterm-256color/Applications/Emacs.app/Contents/MacOS/bin/emacsclient"
alias ekill="emacsclient -e '(kill-emacs)'"
