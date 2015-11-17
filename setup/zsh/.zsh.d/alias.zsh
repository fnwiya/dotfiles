########################################
# alias
########################################
alias ll="ls -l"
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias reload='exec $SHELL -l'
alias evalenv='source ~/dotfiles/setup/zsh/.zshenv'
alias em='emacsclient -n'
alias ekill='emacsclient -e "(kill-emacs)"'

# OS 別の設定
case ${OSTYPE} in
    darwin*)
        #Mac用の設定
        export CLICOLOR=1
        alias ls='ls -A -G -F'
        alias ls='la -A -G -F'
        alias emc='TERM=xterm-256color /usr/local/bin/emacs -nw'
        alias brewupd='brew update && brew upgrade --all && brew doctor'
        ;;
    linux*)
        #Linux用の設定
        alias ls='ls -A -F --color=auto'
        alias la='ls -A -G -F'
        alias aptupd='sudo apt-get update && sudo apt-get upgrade && sudo apt-get autoremove'
        ;;
esac
evalenv # call at login
