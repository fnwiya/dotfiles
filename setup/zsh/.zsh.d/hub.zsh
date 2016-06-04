if [ -x "`which peco`" ]; then
    function git(){hub "$@"}
fi
