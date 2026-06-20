########################################
# 分割ファイルの読み込み
########################################
ZSHHOME="${HOME}/.zsh.d"

if [ -d $ZSHHOME -a -r $ZSHHOME -a -x $ZSHHOME ]; then
    for i in `find ${ZSHHOME}/ -name "*.zsh" -type f`
    do
        if [[ ${i##*/} = peco.zsh ]] && [  -x "`which fzf`" ]; then
            continue
        fi
        if [[ ${i##*/} =~ ^.+\.zsh$ ]] && [ \( -f $i -o -h $i \) -a -r $i ]; then
            . $i
        fi
    done
    source ${ZSHHOME}/fzf.zsh
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/fumiya.kohno/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/fumiya.kohno/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/Users/fnwiya/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/fnwiya/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/fumiya.kohno/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/fumiya.kohno/google-cloud-sdk/completion.zsh.inc'; fi
if [ -f '/Users/fnwiya/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/fnwiya/google-cloud-sdk/completion.zsh.inc'; fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


. "$HOME/.local/bin/env"
