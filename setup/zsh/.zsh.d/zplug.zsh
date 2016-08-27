# http://blog.b4b4r07.com/entry/2015/12/13/174209
# https://github.com/zplug/zplug
if [ ! -d "${HOME}/.zplug" ] ;then
    curl -sL zplug.sh/installer | zsh
fi
source ~/.zplug/init.zsh

# plugins list
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", \
    nice:19
zplug "mollifier/anyframe"
zplug "b4b4r07/emoji-cli", \
    if:'(( $+commands[jq] ))', \
    on:"peco/peco"

# install plugins
if ! zplug check --verbose; then
  printf 'Install? [y/N]: '
  if read -q; then
    echo; zplug install
  fi
fi

zplug load --verbose

# plugins conf
ZSHPLUGINS="${HOME}/.zsh.d/plugins"

if [ -d $ZSHPLUGINS ]; then
    for i in $ZSHPLUGINS/*; do
        [[ ${i##*/} = *.zsh ]] &&
            [ \( -f $i -o -h $i \) -a -r $i ] && . $i
    done
fi
