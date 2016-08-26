# Setup fzf
# ---------

if [  -x "`which fzf`" ]; then

    if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
        export PATH="$PATH:/usr/local/opt/fzf/bin"
    fi

    # Man path
    # --------
    if [[ ! "$MANPATH" == */usr/local/opt/fzf/man* && -d "/usr/local/opt/fzf/man" ]]; then
        export MANPATH="$MANPATH:/usr/local/opt/fzf/man"
    fi

    # Auto-completion
    # ---------------
    [[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null

    # Key bindings
    # ------------
    if [ -f /usr/local/opt/fzf/shell/key-bindings.zsh ]; then
        source "/usr/local/opt/fzf/shell/key-bindings.zsh"
        export FZF_DEFAULT_OPTS="
            --extended
            --ansi
            --multi
            --bind=ctrl-z:toggle-all
        "
    fi

    # fshow - git commit browser (enter for show, ctrl-d for diff)
    fshow() {
        local out shas sha q k
        while out=$(
                git log --graph --color=always \
                    --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
                    fzf --ansi --multi --no-sort --reverse --query="$q" \
                        --print-query --expect=ctrl-d); do
            q=$(head -1 <<< "$out")
            k=$(head -2 <<< "$out" | tail -1)
            shas=$(sed '1,2d;s/^[^a-z0-9]*//;/^$/d' <<< "$out" | awk '{print $1}')
            [ -z "$shas" ] && continue
            if [ "$k" = ctrl-d ]; then
                git diff --color=always $shas | less -R
            else
                for sha in $shas; do
                    git show --color=always $sha | less -R
                done
            fi
        done
    }
    # fkill - kill process
    fkill() {
        pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

        if [ "x$pid" != "x" ]
        then
            kill -${1:-9} $pid
        fi
    }
    # fs [FUZZY PATTERN] - Select selected tmux session
    #   - Bypass fuzzy finder if there's only one match (--select-1)
    #   - Exit if there's no match (--exit-0)
    fs() {
        local session
        session=$(tmux list-sessions -F "#{session_name}" | \
                         fzf --query="$1" --select-1 --exit-0) &&
            tmux switch-client -t "$session"
    }
    # ftpane - switch pane (@george-b)
    ftpane() {
        local panes current_window current_pane target target_window target_pane
        panes=$(tmux list-panes -s -F '#I:#P - #{pane_current_path} #{pane_current_command}')
        current_pane=$(tmux display-message -p '#I:#P')
        current_window=$(tmux display-message -p '#I')

        target=$(echo "$panes" | grep -v "$current_pane" | fzf +m --reverse) || return

        target_window=$(echo $target | awk 'BEGIN{FS=":|-"} {print$1}')
        target_pane=$(echo $target | awk 'BEGIN{FS=":|-"} {print$2}' | cut -c 1)

        if [[ $current_window -eq $target_window ]]; then
            tmux select-pane -t ${target_window}.${target_pane}
        else
            tmux select-pane -t ${target_window}.${target_pane} &&
                tmux select-window -t $target_window
        fi
    }
    # In tmux.conf
    # bind-key 0 run "tmux split-window -l 12 'bash -ci ftpane'"

# Ctrl-R
_peco-select-history() {
    if true; then
        BUFFER="$(
        history 1 \
            | sort -k1,1nr \
            | perl -ne 'BEGIN { my @lines = (); } s/^\s*\d+\s*//; $in=$_; if (!(grep {$in eq $_} @lines)) { push(@lines, $in); print $in; }' \
            | fzf --query "$LBUFFER"
        )"

        CURSOR=$#BUFFER
        #zle accept-line
        #zle clear-screen
        zle reset-prompt
    else
        if is-at-least 4.3.9; then
            zle -la history-incremental-pattern-search-backward && bindkey "^r" history-incremental-pattern-search-backward
        else
            history-incremental-search-backward
        fi
    fi
}
zle -N _peco-select-history
bindkey '^r' _peco-select-history

_peco-tmuxinator() {
    local sql
    sql="$(
    {
        tmuxinator completions start | sed 's/\(.*\)/\1: project name/'
        tmuxinator commands zsh | sed 's/:/: /'
    } | perl -pe 's/^(.*):/\033[31m$1:\033[m/' \
        | fzf --ansi \
        | awk -F: '{print $1}'
    )"

    local current_session
    current_session="$(tmux display-message -p '#S')"
    if contains "$(tmuxinator completions start)"  "$current_session"; then
        echo "$current_session: is running now!" 1>&2
        exit 1
    fi

    if [ -n "$sql" ]; then
        RBUFFER="tmuxinator $sql"
        CURSOR=$#BUFFER
        zle accept-line
    fi
}
#zle -N _peco-tmuxinator
#bindkey '^X' _peco-tmuxinator
peco-select-gitadd() {
    local selected_file_to_add
    selected_file_to_add="$(
    git status --porcelain \
        | perl -pe 's/^( ?.{1,2} )(.*)$/\033[31m$1\033[m$2/' \
        | fzf --ansi --exit-0 \
        | awk -F ' ' '{print $NF}' \
        | tr "\n" " "
    )"

    if [ -n "$selected_file_to_add" ]; then
        BUFFER="git add $selected_file_to_add"
        CURSOR=$#BUFFER
        zle accept-line
    fi
    zle reset-prompt
}
zle -N peco-select-gitadd
bindkey '^g^a' peco-select-gitadd

exec-oneliner() {
    local oneliner_f
    oneliner_f="${ONELINER_FILE:-~/.commnad.list}"

    [[ ! -f $oneliner_f || ! -s $oneliner_f ]] && return

    local cmd q k res accept
    while accept=0; cmd="$(
        cat <$oneliner_f \
            | sed -e '/^#/d;/^$/d' \
            | perl -pe 's/^(\[.*?\]) (.*)$/$1\t$2/' \
            | perl -pe 's/(\[.*?\])/\033[31m$1\033[m/' \
            | perl -pe 's/^(: ?)(.*)$/$1\033[30;47;1m$2\033[m/' \
            | perl -pe 's/^(.*)([[:blank:]]#[[:blank:]]?.*)$/$1\033[30;1m$2\033[m/' \
            | perl -pe 's/(!)/\033[31;1m$1\033[m/' \
            | perl -pe 's/(\|| [A-Z]+ [A-Z]+| [A-Z]+ )/\033[35;1m$1\033[m/g' \
            | fzf --ansi --multi --no-sort --tac --query="$q" \
            --print-query --expect=ctrl-v --exit-0
            )"; do
        q="$(head -1 <<< "$cmd")"
        k="$(head -2 <<< "$cmd" | tail -1)"
        res="$(sed '1,2d;/^$/d;s/[[:blank:]]#.*$//' <<< "$cmd")"
        [ -z "$res" ] && continue
        if [ "$k" = "ctrl-v" ]; then
            vim "$oneliner_f" < /dev/tty > /dev/tty
        else
            cmd="$(perl -pe 's/^(\[.*?\])\t(.*)$/$2/' <<<"$res")"
            if [[ $cmd =~ "!$" || $cmd =~ "! *#.*$" ]]; then
                accept=1
                cmd="$(sed -e 's/!.*$//' <<<"$cmd")"
            fi
            break
        fi
    done

    local len
    if [[ -n $cmd ]]; then
        BUFFER="$(tr -d '@' <<<"$cmd" | perl -pe 's/\n/; /' | sed -e 's/; $//')"
        len="${cmd%%@*}"
        CURSOR=${#len}
        if [[ $accept -eq 1 ]]; then
            zle accept-line
        fi
    fi
    #zle reset-prompt
    zle redisplay
}
zle -N exec-oneliner
bindkey '^x^x' exec-oneliner
fi
