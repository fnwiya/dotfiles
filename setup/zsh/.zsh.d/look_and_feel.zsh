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


setopt interactive_comments # '#' 以降をコメントとして扱う
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
