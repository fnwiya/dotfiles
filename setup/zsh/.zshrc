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
export PGHOST=localhost

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
# 分割ファイルの読み込み
########################################
ZSHHOME="${HOME}/.zsh.d"

if [ -d $ZSHHOME -a -r $ZSHHOME -a \
     -x $ZSHHOME ]; then
    for i in $ZSHHOME/*; do
        [[ ${i##*/} = *.zsh ]] &&
            [ \( -f $i -o -h $i \) -a -r $i ] && . $i
    done
fi

PATH="/home/forcia/perl5/bin${PATH+:}${PATH}"; export PATH;
PERL5LIB="/home/forcia/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/forcia/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/forcia/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/forcia/perl5"; export PERL_MM_OPT;
