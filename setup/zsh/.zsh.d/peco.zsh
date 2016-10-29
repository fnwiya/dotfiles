########################################
# peco
########################################
if [ -x "`which peco`" ]; then
    alias -g P='| peco'
    alias tp='top | peco'
    alias psp='ps aux | peco'

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
    zle -N peco-select-history peco-select-history
    bindkey '^x^h' peco-select-history

    function peco-cdr () {
        local selected_dir=$(cdr -l | awk '{ print $2 }' | peco)
        if [ -n "$selected_dir" ]; then
            BUFFER="cd ${selected_dir}"
            zle accept-line
        fi
        zle clear-screen
    }
    zle -N peco-cdr peco-cdr
    bindkey '^x^b' peco-cdr

    function peco-kill-process () {
        ps -ef | peco | awk '{ print $2 }' | xargs kill
        zle clear-screen
    }
    zle -N peco-kill-process peco-kill-process
    bindkey '^x^k' peco-kill-process

    function peco-ghq-src () {
        local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
        if [ -n "$selected_dir" ]; then
            BUFFER="cd ${selected_dir}"
            zle accept-line
        fi
        zle clear-screen
    }
    zle -N peco-ghq-src peco-ghq-src
    bindkey '^x^g' peco-ghq-src

    function _get_hosts() {
        # historyを番号なし、逆順、ssh*にマッチするものを1番目から表示
        # 最後の項をhost名と仮定してhost部分を取り出す
        local hosts
        hosts="$(history -nrm 'ssh*' 1 | awk '{print $NF}')"
        # know_hostsからもホスト名を取り出す
        # portを指定したり、ip指定でsshしていると
        #   [hoge.com]:2222,[\d{3}.\d{3].\d{3}.\d{3}]:2222
        # といったものもあるのでそれにも対応している
        hosts="$hosts\n$(cut -d' ' -f1  ~/.ssh/known_hosts | tr -d '[]' | tr ',' '\n' | cut -d: -f1)"
        hosts=$(echo $hosts | awk '!a[$0]++')
        echo $hosts
    }

    function peco-ssh() {
        hosts=`_get_hosts`
        local selected_host=$(echo $hosts | peco --prompt="ssh >" --query "$LBUFFER")
        if [ -n "$selected_host" ]; then
            BUFFER="ssh ${selected_host}"
            zle accept-line
        fi
    }
    zle -N peco-ssh
    bindkey '^x^s' peco-ssh
fi
