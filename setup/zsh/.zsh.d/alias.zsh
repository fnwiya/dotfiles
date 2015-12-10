########################################
# alias
########################################
alias sudo='sudo '
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

# OS 別の設定
case ${OSTYPE} in
    darwin*)
        #Mac用の設定
        export CLICOLOR=1
        alias ls='ls -A -G -F'
        alias la='ls -A -G -F'
        alias emc='TERM=xterm-256color /usr/local/bin/emacs -nw'
        alias pkgupd='brew update && brew upgrade --all && brew doctor'
        ;;
    linux*)
        #Linux用の設定
        alias ls='ls -A -F --color=auto'
        alias la='ls -A -G -F'
        alias emc='emacs -nw'
        alias pkgupd='sudo apt-get update && sudo apt-get upgrade && sudo apt-get autoremove'
        alias webstart='sudo /home/forcia/bin/restartWeb.sh start'
        alias webstop='sudo /home/forcia/bin/restartWeb.sh stop'
        alias pbcopy='xsel --clipboard --input'
        ;;
esac
evalenv # call at login
