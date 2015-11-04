########################################
# alias
########################################
alias ll="ls -l"
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias restart='exec $SHELL -l'
alias evalenv='source ~/dotfiles/setup/zsh/.zshenv'
evalenv # call at login

# OS 別の設定
case ${OSTYPE} in
    darwin*)
        #Mac用の設定
        export CLICOLOR=1
        alias ls='ls -A -G -F'
        alias em='TERM=xterm-256color /usr/local/bin/emacs'
        alias brewupd='brew update && brew upgrade --all && brew doctor'
        ;;
    linux*)
        #Linux用の設定
        alias ls='ls -A -F --color=auto'
        ;;
esac
