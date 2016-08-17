########################################
# 環境変数
########################################
export LANG=ja_JP.UTF-8
export KCODE=u
export EDITOR=vim
export SHELL=zsh
## vimがなくてもvimでviを起動する。
if ! type vim > /dev/null 2>&1; then
    alias vim=vi
fi
export PGHOST=localhost

