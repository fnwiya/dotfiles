DOTPATH=~/dotfiles
GITHUB_URL=https://github.com/fnwiya/dotfiles.git

if [ -x "`which git`" ] ; then
    git clone --recursive "$GITHUB_URL" "$DOTPATH"
elif [ -x "`which curl`" ] || [ -x "`which wget`" ] ; then
    tarball=https://github.com/fnwiya/dotfiles/archive/master.tar.gz
    if [ -x "`which curl`" ] ; then
        curl -L "$tarball"
    elif [ -x "`which wget`" ] ; then
        wget -O - "$tarball"
    fi | tar xvz -
    mv -f dotfiles-master "$DOTPATH"
else
    echo "curl or wget required"
fi

cd "$DOTPATH"
if [ $? -ne 0 ]; then
    echo "not found: $DOTPATH"
fi
