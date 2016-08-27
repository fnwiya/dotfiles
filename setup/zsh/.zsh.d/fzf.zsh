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
    zle -N fzf-select-history
    bindkey '^o^h' fzf-select-history

    function fzf-cdr () {
        local selected_dir=$(cdr -l | awk '{ print $2 }' | fzf)
        if [ -n "$selected_dir" ]; then
            BUFFER="cd ${selected_dir}"
            zle accept-line
        fi
        zle clear-screen
    }
    zle -N fzf-cdr
    bindkey '^o^r' fzf-cdr

    function fzf-kill-process () {
        ps -ef | fzf | awk '{ print $2 }' | xargs kill
        zle clear-screen
    }
    zle -N fzf-kill-process
    bindkey '^o^k' fzf-kill-process

    function fzf-ghq-src () {
        local selected_dir=$(ghq list -p | fzf)
        if [ -n "$selected_dir" ]; then
            BUFFER="cd ${selected_dir}"
            zle accept-line
        fi
        zle clear-screen
    }
    zle -N fzf-ghq-src
    bindkey '^o^g' fzf-ghq-src

fi
