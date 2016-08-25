if zplug check "mollifier/anyframe"; then
    autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
    add-zsh-hook chpwd chpwd_recent_dirs
    # expressly specify to use peco
    zstyle ":anyframe:selector:fzf:" command 'fzf'
    bindkey '^xb' anyframe-widget-cdr
    bindkey '^x^b' anyframe-widget-cdr

    bindkey '^xr' anyframe-widget-execute-history
    bindkey '^x^r' anyframe-widget-execute-history

    bindkey '^xi' anyframe-widget-put-history
    bindkey '^x^i' anyframe-widget-put-history

    bindkey '^xg' anyframe-widget-cd-ghq-repository
    bindkey '^x^g' anyframe-widget-cd-ghq-repository

    bindkey '^xk' anyframe-widget-kill
    bindkey '^x^k' anyframe-widget-kill

    bindkey '^xi' anyframe-widget-insert-git-branch
    bindkey '^x^i' anyframe-widget-insert-git-branch

    bindkey '^xc' anyframe-widget-checkout-git-branch
    bindkey '^x^c' anyframe-widget-checkout-git-branch

    bindkey '^xf' anyframe-widget-insert-filename
    bindkey '^x^f' anyframe-widget-insert-filename

    bindkey '^xt' anyframe-widget-tmux-attach
    bindkey '^x^t' anyframe-widget-tmux-attach

    bindkey '^xs' anyframe-widget-select-widget
    bindkey '^x^s' anyframe-widget-select-widget
fi
