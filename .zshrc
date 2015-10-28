########################################
# 環境変数
export LANG=ja_JP.UTF-8

# 色を使用出来るようにする
autoload -Uz colors
colors

# emacs 風キーバインドにする
bindkey -e

# プロンプト
PROMPT="%{${fg[green]}%}[%n@]%{${reset_color}%} %~
%# "

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# beep を無効にする
setopt no_beep

# ディレクトリ名だけでcdする
setopt auto_cd

########################################
# ヒストリ
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt hist_ignore_dups
setopt share_history # 同時に起動したzshの間でヒストリを共有する

########################################
# 補完
autoload -Uz compinit
compinit -u
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 小文字でも大文字にマッチさせる


########################################
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
# alias
alias la="ls -a"
alias ll="ls -l"

########################################
# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

########################################
# notify pwd to ansi-term
function chpwd_emacs_ansi_term() {
    echo '\033AnSiTc' $PWD
}
export TERM=xterm-256color
alias em="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"

if [[ $EMACS =~ "(term:.*)" ]]; then
    chpwd_functions=($chpwd_functions chpwd_emacs_ansi_term)

    echo "\033AnSiTu" $USER
    echo "\033AnSiTh" $HOST
    chpwd_emacs_ansi_term
fi

########################################
# peco
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection
