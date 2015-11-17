DOTPATH=~/dotfiles
GITHUB_URL=https://github.com/fnwiya/dotfiles.git

# git が使えるなら git
if [ -x "`which git`" ] ; then
    git clone "$GITHUB_URL" "$DOTPATH"

# 使えない場合は curl か wget を使用する
elif [ -x "`which curl`" ] || [ -x "`which wget`" ] ; then
    tarball="https://github.com/fnwiya/dotfiles/archive/master.tar.gz"

    # ダウンロードして，tar に流す
    if [ -x "`which curl`" ] ; then
        curl -L "$tarball"

    elif [ -x "`which wget`" ] ; then
        wget -O - "$tarball"

    fi | tar xv -

    # 解凍したら，DOTPATH に置く
    mv -f dotfiles-master "$DOTPATH"

else
    echo "curl or wget required"
fi

cd ~/dotfiles
if [ $? -ne 0 ]; then
    echo "not found: $DOTPATH"
fi
