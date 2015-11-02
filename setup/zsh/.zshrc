########################################
# 環境変数
########################################
export LANG=ja_JP.UTF-8
export KCODE=u
export EDITOR=vim
## vimがなくてもvimでviを起動する。
if ! type vim > /dev/null 2>&1; then
    alias vim=vi
fi

########################################
# look&feel
########################################
# 色を使用出来るようにする
autoload -Uz colors
colors
if [ "$TERM" = "xterm" ]; then
    export TERM="xterm-256color"
fi

setopt print_eight_bit # 日本語ファイル名を表示可能にする
setopt no_beep         # beep を無効にする
bindkey -e             # emacs 風キーバインドにする


########################################
# option
########################################
setopt interactive_comments # '#' 以降をコメントとして扱う
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

########################################
ZSHHOME="${HOME}/.zsh.d"

if [ -d $ZSHHOME -a -r $ZSHHOME -a \
     -x $ZSHHOME ]; then
    for i in $ZSHHOME/*; do
        [[ ${i##*/} = *.zsh ]] &&
            [ \( -f $i -o -h $i \) -a -r $i ] && . $i
    done
fi
