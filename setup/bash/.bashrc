# alias
alias ls='ls -CF'
alias ll='ls -AlC'
alias la='ls -CFA'
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'

# prompt
export PS1='\[\033[0;32m\]\u@\H[\w]\[\033[0;32m\]\n\s \$\[\033[00m\]'

# 環境変数
export PAGER='/usr/bin/lv -c'     # man とかで使われる
export EDITOR='/usr/bin/vim'      # visudo とかで使われる
export HISTSIZE=100000            # これだけコマンド履歴を残す
export LANG='ja_JP.UTF-8'
export LC_ALL='ja_JP.UTF-8'
export LC_MESSAGES='ja_JP.UTF-8'
export TERM=xterm-256color

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
