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
    if [ -f "${HOME}/forciaConf/.zshrc" ]; then
        source ${HOME}/forciaConf/.zshrc
    fi
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/fumiya.kohno/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/fumiya.kohno/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/fumiya.kohno/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/fumiya.kohno/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
