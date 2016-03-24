#!/bin/bash
ln -sf ~/dotfiles/setup/.conkyrc ~
ln -sf ~/dotfiles/setup/.emacs.d ~
ln -sf ~/dotfiles/setup/.gitconfig ~
ln -sf ~/dotfiles/setup/.gitignore_global ~
ln -sf ~/dotfiles/setup/.hgignore_global ~
ln -sf ~/dotfiles/setup/.hgrc ~
ln -sf ~/dotfiles/setup/.peco ~
ln -sf ~/dotfiles/setup/.psqlrc ~
ln -sf ~/dotfiles/setup/.sbclrc ~
ln -sf ~/dotfiles/setup/.tern-config ~
ln -sf ~/dotfiles/setup/.tmux.conf ~
ln -sf ~/dotfiles/setup/bash/.bashrc ~
ln -sf ~/dotfiles/setup/bash/.bash_profile ~
mkdir -p ~/.lein
ln -sf ~/dotfiles/setup/lein/profiles.clj ~/.lein/profiles.clj
ln -sf ~/dotfiles/setup/vim/.vimrc ~
ln -sf ~/dotfiles/setup/vim/.vim ~
ln -sf ~/dotfiles/setup/zsh/.zshrc ~
ln -sf ~/dotfiles/setup/zsh/.zshenv ~
ln -sf ~/dotfiles/setup/zsh/.zsh.d ~
if [ -e $HOME/Dropbox/config-file ]; then
    ln -sf ~/Dropbox/config-file/.netrc ~
fi
# OS 別の設定
case ${OSTYPE} in
    darwin*)
        if [ -e $HOME/Library/Application\ Support/Karabiner ]; then
            ln -sf ~/dotfiles/setup/osx/key4remap/private.xml $karabinerDir/private.xml
        fi
        ;;
    linux*)
        ln -sf ~/dotfiles/setup/linux/.shutter ~
        sudo -u postgres ln -sf ~/dotfiles/setup/.psqlrc /home/postgres/.psqlrc
        ;;
esac
