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
# [/your/dir]                                        [name@hostname]
# %                                                [git] +- [master]
## user&dir
prompt_bar_left="[%d] "
prompt_bar_right="[%n@%m]"
prompt_left="%# " # 一般ユーザなら%/rootユーザなら#

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
}
precmd_functions=($precmd_functions update_prompt)

## vcs_info
# http://qiita.com/mollifier/items/8d5a627d773758dd8078
autoload -Uz vcs_info
autoload -Uz add-zsh-hook
autoload -Uz is-at-least
# 以下の3つのメッセージをエクスポートする
#   $vcs_info_msg_0_ : 通常メッセージ用 (緑)
#   $vcs_info_msg_1_ : 警告メッセージ用 (黄色)
#   $vcs_info_msg_2_ : エラーメッセージ用 (赤)
zstyle ':vcs_info:*' max-exports 3

zstyle ':vcs_info:*' enable git svn hg bzr
# 標準のフォーマット(git 以外で使用)
# misc(%m) は通常は空文字列に置き換えられる
zstyle ':vcs_info:*' formats '[%s-%b]'
zstyle ':vcs_info:*' actionformats '[%s-%b]' '%m' '<!%a>'
zstyle ':vcs_info:(svn|bzr):*' branchformat '%b:r%r'
zstyle ':vcs_info:bzr:*' use-simple true


# for git
if is-at-least 4.3.10; then
    # git 用のフォーマット
    # git のときはステージしているかどうかを表示
    zstyle ':vcs_info:git*' formats "[%s-%b]" "%c%u%m"
    zstyle ':vcs_info:git*' actionformats "[%s-%b]" "%c%u%m" "<!%a>"
    zstyle ':vcs_info:git:*' check-for-changes true
    zstyle ':vcs_info:git:*' stagedstr "+"    # %c で表示する文字列
    zstyle ':vcs_info:git:*' unstagedstr "-"  # %u で表示する文字列
fi

# hooks 設定
if is-at-least 4.3.11; then
    # git のときはフック関数を設定する
    # formats '(%s)-[%b]' '%c%u %m' , actionformats '(%s)-[%b]' '%c%u %m' '<!%a>'
    # のメッセージを設定する直前のフック関数
    # 今回の設定の場合はformat の時は2つ, actionformats の時は3つメッセージがあるので
    # 各関数が最大3回呼び出される。
    zstyle ':vcs_info:git+set-message:*' hooks \
                                            git-hook-begin \
                                            git-untracked \
                                            git-push-status \
                                            git-nomerge-branch \
                                            git-stash-count

    # フックの最初の関数
    # git の作業コピーのあるディレクトリのみフック関数を呼び出すようにする
    # (.git ディレクトリ内にいるときは呼び出さない)
    # .git ディレクトリ内では git status --porcelain などがエラーになるため
    function +vi-git-hook-begin() {
        if [[ $(command git rev-parse --is-inside-work-tree 2> /dev/null) != 'true' ]]; then
            # 0以外を返すとそれ以降のフック関数は呼び出されない
            return 1
        fi
        return 0
    }

    # untracked ファイル表示
    # untracked ファイル(バージョン管理されていないファイル)がある場合は
    # unstaged (%u) に ? を表示
    function +vi-git-untracked() {
        # zstyle formats, actionformats の2番目のメッセージのみ対象にする
        if [[ "$1" != "1" ]]; then
            return 0
        fi
        if command git status --porcelain 2> /dev/null \
            | awk '{print $1}' \
            | command grep -F '??' > /dev/null 2>&1 ; then
            # unstaged (%u) に追加
            hook_com[unstaged]+='?'
        fi
    }
    # push していないコミットの件数表示
    # リモートリポジトリに push していないコミットの件数を
    # pN という形式で misc (%m) に表示する
    function +vi-git-push-status() {
        # zstyle formats, actionformats の2番目のメッセージのみ対象にする
        if [[ "$1" != "1" ]]; then
            return 0
        fi
        if [[ "${hook_com[branch]}" != "master" ]]; then
            # master ブランチでない場合は何もしない
            return 0
        fi
        # push していないコミット数を取得する
        local ahead
        ahead=$(command git rev-list origin/master..master 2>/dev/null \
            | wc -l \
            | tr -d ' ')

        if [[ "$ahead" -gt 0 ]]; then
            # misc (%m) に追加
            hook_com[misc]+="(p${ahead})"
        fi
    }
    # マージしていない件数表示
    # master 以外のブランチにいる場合に、
    # 現在のブランチ上でまだ master にマージしていないコミットの件数を
    # (mN) という形式で misc (%m) に表示
    function +vi-git-nomerge-branch() {
        # zstyle formats, actionformats の2番目のメッセージのみ対象にする
        if [[ "$1" != "1" ]]; then
            return 0
        fi
        if [[ "${hook_com[branch]}" == "master" ]]; then
            # master ブランチの場合は何もしない
            return 0
        fi
        local nomerged
        nomerged=$(command git rev-list master..${hook_com[branch]} 2>/dev/null | wc -l | tr -d ' ')

        if [[ "$nomerged" -gt 0 ]] ; then
            # misc (%m) に追加
            hook_com[misc]+="(m${nomerged})"
        fi
    }
    # stash 件数表示
    # stash している場合は :SN という形式で misc (%m) に表示
    function +vi-git-stash-count() {
        # zstyle formats, actionformats の2番目のメッセージのみ対象にする
        if [[ "$1" != "1" ]]; then
            return 0
        fi
        local stash
        stash=$(command git stash list 2>/dev/null | wc -l | tr -d ' ')
        if [[ "${stash}" -gt 0 ]]; then
            # misc (%m) に追加
            hook_com[misc]+=":S${stash}"
        fi
    }
fi

function _update_vcs_info_msg() {
    local -a messages
    local prompt
    LANG=en_US.UTF-8 vcs_info
    if [[ -z ${vcs_info_msg_0_} ]]; then
        # vcs_info で何も取得していない場合はプロンプトを表示しない
        vcs_info_prompt=""
    else
        # vcs_info で情報を取得した場合
        # $vcs_info_msg_0_ , $vcs_info_msg_1_ , $vcs_info_msg_2_ を
        # それぞれ緑、黄色、赤で表示する
        [[ -n "$vcs_info_msg_0_" ]] && messages+=( "%F{green}${vcs_info_msg_0_}%f" )
        [[ -n "$vcs_info_msg_1_" ]] && messages+=( "%F{yellow}${vcs_info_msg_1_}%f" )
        [[ -n "$vcs_info_msg_2_" ]] && messages+=( "%F{red}${vcs_info_msg_2_}%f" )
        # 間にスペースを入れて連結する
        vcs_info_prompt="${(j: :)messages}"
    fi
    RPROMPT="$vcs_info_prompt"
}
add-zsh-hook precmd _update_vcs_info_msg

########################################
# directory
########################################
setopt auto_cd           # ディレクトリ名だけでcdする
setopt auto_pushd        # cd時にディレクトリスタックにpushdする
function chpwd() { ls -A -F} #cdしたあとで、自動的に ls する
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
alias evalenv='source ~/dotfiles/setup/zsh/.zshenv'

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
