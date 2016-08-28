#!/bin/bash
ln -sf ~/dotfiles/setup/.conkyrc ~
ln -sf ~/dotfiles/setup/.emacs.d ~
ln -sf ~/dotfiles/setup/.peco ~
ln -sf ~/dotfiles/setup/.psqlrc ~
ln -sf ~/dotfiles/setup/.sbclrc ~
ln -sf ~/dotfiles/setup/.tern-config ~
ln -sf ~/dotfiles/setup/bash/.bashrc ~
ln -sf ~/dotfiles/setup/bash/.bash_profile ~
ln -sf ~/dotfiles/setup/git/.gitconfig ~
ln -sf ~/dotfiles/setup/git/.gitignore_global ~
ln -sf ~/dotfiles/setup/hg/.hgignore_global ~
ln -sf ~/dotfiles/setup/hg/.hgrc ~
mkdir -p ~/.lein
ln -sf ~/dotfiles/setup/lein/profiles.clj ~/.lein/profiles.clj
ln -sf ~/dotfiles/setup/linter/.eslintrc ~
ln -sf ~/dotfiles/setup/tmux/.tmux.conf ~
ln -sf ~/dotfiles/setup/tmux/.tmux ~
ln -sf ~/dotfiles/setup/vim/.vimrc ~
ln -sf ~/dotfiles/setup/vim/.vim ~
ln -sf ~/dotfiles/setup/zsh/.zshrc ~
ln -sf ~/dotfiles/setup/zsh/.zshenv ~
ln -sf ~/dotfiles/setup/zsh/.zsh.d ~
ln -sfn ~/dotfiles/submodules/fzf ~/.fzf
ln -sf ~/dotfiles/setup/ranger/rc.conf ~/.config/ranger/rc.conf
ln -sf ~/dotfiles/setup/ranger/rifle.conf ~/.config/ranger/rifle.conf
ln -sf ~/dotfiles/setup/ranger/scope.sh ~/.config/ranger/scope.sh
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
        ln -sf ~/dotfiles/setup/x/.xsession ~
        ln -sf ~/dotfiles/setup/x/.Xmodmap ~
        ln -sf ~/dotfiles/setup/x/.Xdefaults ~
        ln -sf ~/dotfiles/setup/.xmonad ~
        ln -sf ~/dotfiles/setup/.stalonetrayrc ~
        ln -sf ~/dotfiles/setup/linux/.shutter ~
        # sudo -u postgres ln -sf ~/dotfiles/setup/.psqlrc /home/postgres/.psqlrc
        ;;
esac
