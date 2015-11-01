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
# prompt
########################################
# looks like bellow
# [/your/dir]                                            [name@hostname]
# %                                                         [git:branch]
prompt_bar_left="[%d] "
prompt_bar_right="[%n@%m]"
prompt_left="%# " # 一般ユーザなら%/rootユーザなら#
# http://eseth.org/2010/git-in-zsh.html
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*:*' get-revision true
zstyle ':vcs_info:git*:*' check-for-changes true

# hash changes branch misc
zstyle ':vcs_info:git*' formats "[%s] %12.12i %c%u %b%m"
zstyle ':vcs_info:git*' actionformats "(%s|%a) %12.12i %c%u %b%m"

zstyle ':vcs_info:git*+set-message:*' hooks git-st git-stash

# Show remote ref name and number of commits ahead-of or behind
function +vi-git-st() {
    local ahead behind remote
    local -a gitstatus

    # Are we on a remote-tracking branch?
    remote=${$(git rev-parse --verify ${hook_com[branch]}@{upstream} \
        --symbolic-full-name 2>/dev/null)/refs\/remotes\/}
    if [[ -n ${remote} ]] ; then
        # for git prior to 1.7
        # ahead=$(git rev-list origin/${hook_com[branch]}..HEAD | wc -l)
        ahead=$(git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l)
        (( $ahead )) && gitstatus+=( "${c3}+${ahead}${c2}" )
        # for git prior to 1.7
        # behind=$(git rev-list HEAD..origin/${hook_com[branch]} | wc -l)
        behind=$(git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l)
        (( $behind )) && gitstatus+=( "${c4}-${behind}${c2}" )

        hook_com[branch]="${hook_com[branch]} [${remote} ${(j:/:)gitstatus}]"
    fi
}
# Show count of stashed changes
function +vi-git-stash() {
    local -a stashes
    if [[ -s ${hook_com[base]}/.git/refs/stash ]] ; then
        stashes=$(git stash list 2>/dev/null | wc -l)
        hook_com[misc]+=" (${stashes} stashed)"
    fi
}

count_prompt_characters(){
    print -n -P -- "$1" | sed -e $'s/\e\[[0-9;]*m//g' | wc -m | sed -e 's/ //g'
}

update_prompt(){
    local bar_right_length=$(count_prompt_characters "$prompt_bar_right")
    local bar_without_right_length=$[COLUMNS - bar_right_length]
    local bar_right="$prompt_bar_right"
    local bar_left_without_path="${prompt_bar_left:s/%d//}"
    local bar_left_without_path_length=$(count_prompt_characters "$bar_left_without_path")
    local max_path_length=$[bar_without_right_length - bar_left_without_path_length]
    bar_left=${prompt_bar_left:s/%d/%(C,%${max_path_length}<...<%d%<<,)/}
    local bar_left_length=$(count_prompt_characters ${bar_left})
    local separator_length=$[bar_without_right_length - bar_left_length]
    local separator="${(l:${separator_length}:: :)}"
    bar_right="${separator}${bar_right}"

    PROMPT="%F{green}${bar_left}${bar_right}%f"$'\n'"${prompt_left}"

    LANG=C vcs_info >&/dev/null
    if [ -n "$vcs_info_msg_0_" ]; then
        RPROMPT="%F{green}${vcs_info_msg_0_}%f"
    else
        RPROMPT=""
    fi
}

precmd_functions=($precmd_functions update_prompt)

########################################
# directory
########################################
setopt auto_cd           # ディレクトリ名だけでcdする
setopt auto_pushd        # cd時にディレクトリスタックにpushdする
function chpwd() { ls } #cdしたあとで、自動的に ls する
########################################
# history
########################################
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt hist_ignore_dups     # 前と重複する行は記録しない
setopt share_history        # 同時に起動したzshの間でヒストリを共有する
setopt hist_reduce_blanks   # 余分なスペースを削除してヒストリに保存する
setopt HIST_IGNORE_SPACE    # 行頭がスペースのコマンドは記録しない
setopt HIST_IGNORE_ALL_DUPS # 履歴中の重複行をファイル記録前に無くす
setopt HIST_FIND_NO_DUPS    # 履歴検索中、(連続してなくとも)重複を飛ばす
setopt HIST_NO_STORE        # histroyコマンドは記録しない
# http://mollifier.hatenablog.com/entry/20090728/p1
zshaddhistory() {
    local line=${1%%$'\n'} #コマンドライン全体から改行を除去したもの
    local cmd=${line%% *}  # １つ目のコマンド
    # 以下の条件をすべて満たすものだけをヒストリに追加する
    [[ ${#line} -ge 5
        && ${cmd} != (l|l[sal])
        && ${cmd} != (cd)
        && ${cmd} != (m|man)
        && ${cmd} != (r[mr])
    ]]
}

########################################
# 補完
########################################
autoload -Uz compinit
compinit -u
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 小文字でも大文字にマッチさせる
setopt correct                 # コマンドのスペルを訂正する
setopt auto_list               # 補完候補を一覧で表示する(d)
setopt auto_menu               # 補完キー連打で補完候補を順に表示する(d)
setopt list_packed             # 補完候補をできるだけ詰めて表示する
setopt list_types              # 補完候補にファイルの種類も表示する

########################################
# alias
########################################
alias ll="ls -l"
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias restart='exec $SHELL -l'
alias evalenv='source ~/dotfiles/zsh/.zshenv'

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

########################################
# option
########################################
setopt interactive_comments # '#' 以降をコメントとして扱う
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

########################################
# peco
########################################
if [ -x "`which peco`" ]; then
    alias -g P='| peco'
    alias ll='ls -la | peco'
    alias tp='top | peco'
    alias pp='ps aux | peco'

    function peco-select-history() {
        local tac
        if which tac > /dev/null; then
            tac="tac"
        else
            tac="tail -r"
        fi
        BUFFER=$(history -n 1 | eval $tac | awk '!a[$0]++' | peco --query "$LBUFFER")
        CURSOR=$#BUFFER
        zle clear-screen
    }

    autoload -Uz is-at-least
    if is-at-least 4.3.11
    then
        autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
        add-zsh-hook chpwd chpwd_recent_dirs
        zstyle ':chpwd:*' recent-dirs-max 5000
        zstyle ':chpwd:*' recent-dirs-default yes
        zstyle ':completion:*' recent-dirs-insert both
    fi
    zle -N peco-select-history
    bindkey '^r' peco-select-history

    function peco-cdr () {
        local selected_dir=$(cdr -l | awk '{ print $2 }' | peco)
        if [ -n "$selected_dir" ]; then
            BUFFER="cd ${selected_dir}"
            zle accept-line
        fi
        zle clear-screen
    }
    zle -N peco-cdr
    bindkey '^f' peco-cdr

    function peco-kill-process () {
        ps -ef | peco | awk '{ print $2 }' | xargs kill
        zle clear-screen
    }
    zle -N peco-kill-process
    bindkey '^xk' peco-kill-process

#    function peco-z-search
#    {
#      which peco z > /dev/null
#      if [ $? -ne 0 ]; then
#        echo "Please install peco and z"
#        return 1
#      fi
#      local res=$(z | sort -rn | cut -c 12- | peco)
#      if [ -n "$res" ]; then
#        BUFFER+="cd $res"
#        zle accept-line
#      else
#        return 1
#      fi
#    }
#    zle -N peco-z-search
#    bindkey '^f' peco-z-search
fi
########################################
# z
########################################
#_Z_CMD=j
#. `brew --prefix`/etc/profile.d/z.sh
#function precmd() {
#    z --add "$(pwd -P)"
#}
