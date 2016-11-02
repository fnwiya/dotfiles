#!/bin/bash
dotfilesPath=${1:-~}
ln -sf $dotfilesPath/dotfiles/setup/.conkyrc $HOME
ln -sf $dotfilesPath/dotfiles/setup/.emacs.d $HOME
ln -sf $dotfilesPath/dotfiles/setup/.ghci.conf $HOME
ln -sf $dotfilesPath/dotfiles/setup/.peco $HOME
ln -sf $dotfilesPath/dotfiles/setup/.psqlrc $HOME
ln -sf $dotfilesPath/dotfiles/setup/.sbclrc $HOME
ln -sf $dotfilesPath/dotfiles/setup/.tern-config $HOME
ln -sf $dotfilesPath/dotfiles/setup/bash/.bashrc $HOME
ln -sf $dotfilesPath/dotfiles/setup/bash/.bash_profile $HOME
ln -sf $dotfilesPath/dotfiles/setup/git/.gitconfig $HOME
ln -sf $dotfilesPath/dotfiles/setup/git/.gitignore_global $HOME
ln -sf $dotfilesPath/dotfiles/setup/hg/.hgignore_global $HOME
ln -sf $dotfilesPath/dotfiles/setup/hg/.hgrc $HOME
mkdir -p $HOME/.lein
ln -sf $dotfilesPath/dotfiles/setup/lein/profiles.clj $HOME/.lein/profiles.clj
ln -sf $dotfilesPath/dotfiles/setup/linter/.eslintrc $HOME
ln -sf $dotfilesPath/dotfiles/setup/tmux/.tmux.conf $HOME
ln -sf $dotfilesPath/dotfiles/setup/tmux/.tmux $HOME
ln -sf $dotfilesPath/dotfiles/setup/vim/.vimrc $HOME
ln -sf $dotfilesPath/dotfiles/setup/vim/.vim $HOME
ln -sf $dotfilesPath/dotfiles/setup/zsh/.zshrc $HOME
ln -sf $dotfilesPath/dotfiles/setup/zsh/.zshenv $HOME
ln -sf $dotfilesPath/dotfiles/setup/zsh/.zsh.d $HOME
ln -sfn $dotfilesPath/dotfiles/submodules/fzf $HOME/.fzf
mkdir -p $HOME/.config/ranger
ln -sf $dotfilesPath/dotfiles/setup/ranger/rc.conf $HOME/.config/ranger/rc.conf
ln -sf $dotfilesPath/dotfiles/setup/ranger/rifle.conf $HOME/.config/ranger/rifle.conf
ln -sf $dotfilesPath/dotfiles/setup/ranger/scope.sh $HOME/.config/ranger/scope.sh
if [ -e $dotfilesPath/Dropbox/config-file ]; then
    ln -sf $dotfilesPath/Dropbox/config-file/.netrc $HOME
fi
# OS 別の設定
case ${OSTYPE} in
    darwin*)
        if [ -e $HOME/Library/Application\ Support/Karabiner ]; then
            ln -sf $dotfilesPath/dotfiles/setup/osx/key4remap/private.xml $karabinerDir/private.xml
        fi
        ;;
    linux*)
        ln -sf $dotfilesPath/dotfiles/setup/x/.Xmodmap $HOME
        ln -sf $dotfilesPath/dotfiles/setup/x/.Xdefaults $HOME
        ln -sf $dotfilesPath/dotfiles/setup/.xmonad $HOME
        ln -sf $dotfilesPath/dotfiles/setup/.stalonetrayrc $HOME
        ln -sf $dotfilesPath/dotfiles/setup/linux/.shutter $HOME
        # sudo -u postgres ln -sf $dotfilesPath/dotfiles/setup/.psqlrc /home/postgres/.psqlrc
        ;;
esac
