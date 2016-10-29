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
            --reverse
            --extended
            --ansi
            --multi
            --bind=ctrl-z:toggle-all
        "
    fi

    function fzf-select-history() {
        local tac
        if which tac > /dev/null; then
            tac="tac"
        else
            tac="tail -r"
        fi
        BUFFER=$(history -n 1 | eval $tac | awk '!a[$0]++' | fzf)
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
    zle -N fzf-select-history fzf-select-history
    bindkey '^z^h' fzf-select-history

    function fzf-cdr () {
        local selected_dir=$(cdr -l | awk '{ print $2 }' | fzf)
        if [ -n "$selected_dir" ]; then
            BUFFER="cd ${selected_dir}"
            zle accept-line
        fi
        zle clear-screen
    }
    zle -N fzf-cdr fzf-cdr
    bindkey '^x^b' fzf-cdr

    function fzf-kill-process () {
        ps -ef | fzf | awk '{ print $2 }' | xargs kill
        zle clear-screen
    }
    zle -N fzf-kill-process fzf-kill-process
    bindkey '^x^k' fzf-kill-process

    function fzf-ghq-src () {
        local selected_dir=$(ghq list -p | fzf)
        if [ -n "$selected_dir" ]; then
            BUFFER="cd ${selected_dir}"
            zle accept-line
        fi
        zle clear-screen
    }
    zle -N fzf-ghq-src fzf-ghq-src
    bindkey '^x^g' fzf-ghq-src

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

fi
