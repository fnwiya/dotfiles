#!/bin/bash
ln -sf ~/dotfiles/vim/.vimrc ~/.vimrc
ln -sf ~/dotfiles/vim/.vim ~
ln -sf ~/dotfiles/.emacs.d ~
ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/dotfiles/zsh/.zshrc ~/.zshenv
ln -sf ~/dotfiles/bash/.bashrc ~/.bashrc
ln -sf ~/dotfiles/bash/.bashrc ~/.bash_profile
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.peco ~/.peco
ln -sf ~/dotfiles/.sbclrc ~/.sbclrc
ln -sf ~/dotfiles/gem/.gemrc ~/.gemrc
ln -sf ~/dotfiles/gem/.gem ~/.gem
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
karabinerDir=~/Library/Application Support/Karabiner
if [ -e $karabinerDir ]; then
    ln -sf ~/dotfiles/install/osx/key4remap/private.xml $karabinerDir/private.xml
fi
