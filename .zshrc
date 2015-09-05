########################################
# 環境変数
export LANG=ja_JP.UTF-8
 
# 色を使用出来るようにする
autoload -Uz colors
colors
 
# emacs 風キーバインドにする
bindkey -e
 
# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
 
# プロンプト
PROMPT="%{${fg[green]}%}[%n@]%{${reset_color}%} %~
%# "
  
# 補完機能を有効にする
autoload -Uz compinit
compinit -u
 
# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
 
# 日本語ファイル名を表示可能にする
setopt print_eight_bit
 
# beep を無効にする
setopt no_beep

# ディレクトリ名だけでcdする
setopt auto_cd
  
# 同時に起動したzshの間でヒストリを共有する
setopt share_history
   
# OS 別の設定
case ${OSTYPE} in
    darwin*)
        #Mac用の設定
        export CLICOLOR=1
        alias ls='ls -G -F'
        ;;
    linux*)
        #Linux用の設定
        alias ls='ls -F --color=auto'
        ;;
esac

######################################## 
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

#virtualenv
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# notify pwd to ansi-term
function chpwd_emacs_ansi_term() {
    echo '\033AnSiTc' $PWD
}

alias em="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"

if [[ $EMACS =~ "(term:.*)" ]]; then
    chpwd_functions=($chpwd_functions chpwd_emacs_ansi_term)

    echo "\033AnSiTu" $USER
    echo "\033AnSiTh" $HOST
    chpwd_emacs_ansi_term
fi

