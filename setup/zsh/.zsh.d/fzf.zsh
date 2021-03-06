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

    export FZF_DEFAULT_OPTS="
            --reverse
            --extended
            --ansi
            --multi
            --bind=ctrl-z:toggle-all
            --color dark,hl:33,hl+:37,fg+:235,bg+:136,fg+:254
            --color info:254,prompt:37,spinner:108,pointer:235,marker:235
        "

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
    bindkey '^x^h' fzf-select-history

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
        ps -ef | fzf --multi | awk '{ print $2 }' | xargs kill
        zle clear-screen
    }
    zle -N fzf-kill-process
    bindkey '^x^k' fzf-kill-process

    function fzf-ghq-src () {
        local selected_dir=$(ghq list -p | fzf)
        if [ -n "$selected_dir" ]; then
            BUFFER="cd ${selected_dir}"
            zle accept-line
        fi
        zle clear-screen
    }
    zle -N fzf-ghq-src
    bindkey '^x^g' fzf-ghq-src

    function fzf-ssh () {
        local selected_host=$(cat ~/.ssh/config | grep HostName | awk '{print $2}' | fzf)
        if [ -n "$selected_host" ]; then
            BUFFER="ssh ${selected_host}"
            zle accept-line
        fi
        zle clear-screen
    }
    zle -N fzf-ssh
    bindkey '^x^[' fzf-ssh

    function fzf-tmux-window () {
        tmux list-windows | fzf | cut -d : -f1 | xargs tmux select-window -t
        zle clear-screen
    }
    zle -N fzf-tmux-window
    bindkey '^xt' fzf-tmux-window

    function fzf-youtube () {
        local title=$(cat ~/Dropbox/favoriteSongs.tsv | cut -f1 | fzf)
        if [ -n "$title" ]; then
            url=$(grep ${title} ~/Dropbox/favoriteSongs.tsv | cut -f2)
            BUFFER="youtube-dl '${url}' -o - | mplayer - -novideo"
            zle accept-line
        fi
        zle clear-screen
    }
    zle -N fzf-youtube fzf-youtube
    bindkey '^x^v' fzf-youtube

    function fzf-fg () {
        local job=$(jobs | fzf)
        if [ -n "$job" ]; then
            jobId=$(grep -o '^\[.*\]' ${jobs} | tr -d [ | tr -d ])
            BUFFER="fg '${jobId}'"
            zle accept-line
        fi
        zle clear-screen
    }
    zle -N fzf-fg fzf-fg
    bindkey '^x^f' fzf-fg

    function fzf-git-log() {
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

    function fzf-git-add-files() {
        local addfiles
        addfiles=($(git status --short | grep -v '##' | awk '{ print $2 }' | fzf --multi))
        if [[ -n $addfiles ]]; then
            git add ${@:1} $addfiles && echo "added: $addfiles"
        else
            echo "nothing added."
        fi
    }

    function fzf-grunt() {
        local tasks
        tasks=($(grunt -h --no-color | sed -n '/^Available tasks/,/^$/ {s/^  *\([^ ]\+\)  [^ ]\+.*$/\1/p}' | fzf --multi))
        if [[ -n $tasks ]]; then
            grunt $tasks
        else
            echo "no tasks"
        fi
    }

    function fzf-rg() {
        local line
        line=`rg "$1" | fzf` \
               && vim $(cut -d':' -f1 <<< "$line") +$(cut -d':' -f2 <<< "$line")
    }

    function fzf-npm-scripts() {
        local script
        script=($(cat package.json | jq -r '.scripts | keys[]' | fzf))
        if [[ -n $script ]]; then
            npm run  $script
        else
            echo "no script"
        fi
    }


    function fzf-tree() {
        local SELECTED_FILE=$(tree --charset=o -f | fzf --query "$LBUFFER" | tr -d '\||`|-' | xargs echo)
        if [ "$SELECTED_FILE" != "" ]; then
            vim $SELECTED_FILE
        fi
    }

     function fzf-git-branch() {
        local SELECTED_BRANCH=$(git for-each-ref --format='%(refname)' --sort=-committerdate refs/heads | perl -pne 's{^refs/heads/}{}' | fzf --query "$LBUFFER")

        if [ -n "$SELECTED_BRANCH" ]; then
            git checkout $SELECTED_BRANCH
        fi
    }
    alias fzf-memo='memo grep list | fzf | cut -d : -f 1,2 | xargs code -g'
fi
