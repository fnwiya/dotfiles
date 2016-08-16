if zplug check "mollifier/anyframe"; then
    autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
    add-zsh-hook chpwd chpwd_recent_dirs
    # expressly specify to use peco
    zstyle ":anyframe:selector:" use peco
    zstyle ":anyframe:selector:peco:" command 'peco'
    bindkey '^xb' anyframe-widget-cdr
    bindkey '^x^b' anyframe-widget-checkout-git-branch

    bindkey '^xr' anyframe-widget-execute-history
    bindkey '^x^r' anyframe-widget-execute-history

    bindkey '^xi' anyframe-widget-put-history
    bindkey '^x^i' anyframe-widget-put-history

    bindkey '^xg' anyframe-widget-cd-ghq-repository
    bindkey '^x^g' anyframe-widget-cd-ghq-repository

    bindkey '^xk' anyframe-widget-kill
    bindkey '^x^k' anyframe-widget-kill

    bindkey '^xe' anyframe-widget-insert-git-branch
    bindkey '^x^e' anyframe-widget-insert-git-branch
fi
