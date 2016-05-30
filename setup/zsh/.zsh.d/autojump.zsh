
# OS 別の設定
case ${OSTYPE} in
    darwin*)
        #Mac用の設定
        [[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
         ;;
    linux*)
        #Linux用の設定
       [[ -s /usr/share/autojump/autojump.zsh ]] && . /usr/share/autojump/autojump.zsh
       ;;
esac
