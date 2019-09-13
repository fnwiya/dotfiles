########################################
# alias
########################################
alias sudo='sudo '
alias la='ls -A -G -F'
alias ll="ls -l"
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias reload='exec $SHELL -l'
alias evalenv='source ~/dotfiles/setup/zsh/.zshenv'
alias em='emacsclient -n'
alias ekill='emacsclient -e "(kill-emacs)"'
alias gitupd='git add --all . && git commit -m "update" && git push'
alias gitroot='cd $(git rev-parse --show-toplevel)'
alias gitpullrebase='git stash && git pull --rebase && git stash pop stash@{0}'
alias gitmasterpull='git switch master  && git pull --rebase'
alias multi_ssh='~/dotfiles/setup/tmux/.tmux/multi_ssh.sh'
alias rust='cargo-script'
function ssh() {
  if [[ -n $(printenv TMUX) ]]
  then
    local window_name=$(tmux display -p '#{window_name}')
    tmux rename-window -- "$@[-1]" # zsh specified
    # tmux rename-window -- "${!#}" # for bash
    command ssh $@
    tmux rename-window $window_name
  else
    command ssh $@
  fi
}
function psgr () {
    ps aux | grep  "$*" | grep -v grep
}
function wether () {
    Area=$1
    if [  "$1" = "" ]; then
        Area="Shinjuku-Ku"
    fi
    curl "http://wttr.in/${Area}"
}

function rmself () {
    p=$(pwd)
    cd ../
    rm -rf $p
}
if [ $SHLVL = 1 ]; then
    alias tmuxnew="tmux attach || tmux new-session \; source-file ~/.tmux/session"
fi
alias catalina='less /usr/local/tomcat/logs/catalina.out'
# OS 別の設定
case ${OSTYPE} in
    darwin*)
        #Mac用の設定
        export CLICOLOR=1
        alias ls='ls -A -G -F'
        alias emc='TERM=xterm-256color /usr/local/bin/emacs -nw'
        alias pkgupd='brew update && brew upgrade && brew doctor'
        ;;
    linux*)
        #Linux用の設定
        alias ls='ls -A -F --color=auto'
        alias emc='emacs -nw'
        alias pkgupd='sudo apt-get update -y && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y && sudo apt-get autoremove -y'
        alias pbcopy='xsel --clipboard --input'
        alias open='xdg-open'
        alias volumup='amixer sset Master 1%+'
        alias volumdown='amixer sset Master 1%-'
        alias volumon='amixer sset Master on'
        alias volumoff='amixer sset Master off'
        ;;
esac
evalenv # call at login
