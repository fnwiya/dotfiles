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
# 見た目
########################################
# 色を使用出来るようにする
autoload -Uz colors
colors

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# beep を無効にする
setopt no_beep

########################################
# プロンプト
########################################
# Copyright 2011-2015 Kouhei Sutou <kou@clear-code.com>
# https://github.com/clear-code/zsh.d/blob/master/zshrc
# looks like bellow
# [name@hostname]                                                     [/your/dir]
# %                                                                  [git:branch]
prompt_bar_left="[%n@%m]"
prompt_bar_right="[%d]"
prompt_left="%# " # 一般ユーザなら%/rootユーザなら#
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '[%s:%b]'

count_prompt_characters(){
    print -n -P -- "$1" | sed -e $'s/\e\[[0-9;]*m//g' | wc -m | sed -e 's/ //g'
}

update_prompt(){
    local bar_left_length=$(count_prompt_characters "$prompt_bar_left")
    local bar_rest_length=$[COLUMNS - bar_left_length]
    local bar_left="$prompt_bar_left"
    local bar_right_without_path="${prompt_bar_right:s/%d//}"
    local bar_right_without_path_length=$(count_prompt_characters "$bar_right_without_path")
    local max_path_length=$[bar_rest_length - bar_right_without_path_length]
    bar_right=${prompt_bar_right:s/%d/%(C,%${max_path_length}<...<%d%<<,)/}
    local separator="${(l:${bar_rest_length}:: :)}"
    bar_right="%${bar_rest_length}<<${separator}${bar_right}%<<"

    PROMPT="${bar_left}${bar_right}"$'\n'"${prompt_left}"

    LANG=C vcs_info >&/dev/null
    if [ -n "$vcs_info_msg_0_" ]; then
        RPROMPT="${vcs_info_msg_0_}"
    fi
}

precmd_functions=($precmd_functions update_prompt)
########################################
# 操作感
########################################
# emacs 風キーバインドにする
bindkey -e

########################################
# ディレクトリ
########################################
setopt auto_cd           # ディレクトリ名だけでcdする
setopt auto_pushd        # cd時にディレクトリスタックにpushdする
function chpwd() { ls } #cdしたあとで、自動的に ls する
########################################
# ヒストリ
########################################
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt hist_ignore_dups
setopt share_history # 同時に起動したzshの間でヒストリを共有する
setopt hist_reduce_blanks # 余分なスペースを削除してヒストリに保存する

########################################
# 補完
########################################
autoload -Uz compinit
compinit -u
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 小文字でも大文字にマッチさせる
setopt correct           # コマンドのスペルを訂正する
setopt auto_list               # 補完候補を一覧で表示する(d)
setopt auto_menu               # 補完キー連打で補完候補を順に表示する(d)
setopt list_packed             # 補完候補をできるだけ詰めて表示する
setopt list_types              # 補完候補にファイルの種類も表示する
bindkey "^[[Z" reverse-menu-complete  # Shift-Tabで補完候補を逆順する("\e[Z"でも動作する)

########################################
# alias
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

alias la="ls -a"
alias ll="ls -l"
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'

########################################
# option
########################################
# '#' 以降をコメントとして扱う
setopt interactive_comments

########################################
# 
########################################
