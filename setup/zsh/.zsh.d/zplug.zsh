# http://blog.b4b4r07.com/entry/2015/12/13/174209
# https://github.com/zplug/zplug
if [ -x "`which zplug`" ] ;then
    curl -sL zplug.sh/installer | zsh
fi
source ~/.zplug/init.zsh

# プラグイン定義
zplug "zplug/zplug"
zplug "zsh-users/zsh-history-substring-search"
zplug 'zsh-users/zsh-syntax-highlighting'
zplug "mollifier/anyframe"

if ! zplug check --verbose; then
  printf 'Install? [y/N]: '
  if read -q; then
    echo; zplug install
  fi
fi

zplug load --verbose

ZSHPLUGINS="${HOME}/.zsh.d/plugins"

if [ -d $ZSHPLUGINS -a -r $ZSHPLUGINS -a -x $ZSHPLUGINS ]; then
    for i in $ZSHPLUGINS/*; do
        [[ ${i##*/} = *.zsh ]] &&
            [ \( -f $i -o -h $i \) -a -r $i ] && . $i
    done
fi
