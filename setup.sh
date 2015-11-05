#!/bin/bash
ln -sf ~/dotfiles/.gitconfig ~
ln -sf ~/dotfiles/setup/vim/.vimrc ~
ln -sf ~/dotfiles/setup/vim/.vim ~
ln -sf ~/dotfiles/setup/.emacs.d ~
ln -sf ~/dotfiles/setup/zsh/.zshrc ~
ln -sf ~/dotfiles/setup/zsh/.zshenv ~
ln -sf ~/dotfiles/setup/zsh/.zsh.d ~
# http://qiita.com/harapeko_wktk/items/47aee77e6e7f7800fa03
# zsh as a default
ln -sf ~/dotfiles/setup/bash/.bashrc ~
ln -sf ~/dotfiles/setup/bash/.bash_profile ~
ln -sf ~/dotfiles/setup/.tmux.conf ~
ln -sf ~/dotfiles/setup/.peco ~
ln -sf ~/dotfiles/setup/.sbclrc ~
# OS 別の設定
case ${OSTYPE} in
    darwin*)
        #Mac用の設定
        # karabinerDir=~/Library/Application Support/Karabiner
        # if [ -e $karabinerDir ]; then
        #     ln -sf ~/dotfiles/setup/osx/key4remap/private.xml $karabinerDir/private.xml
        # fi
        ;;
    linux*)
        #Linux用の設定
        ln -sf ~/dotfiles/setup/linux/.shutter ~
        ;;
esac
