#!/bin/bash

#参考 https://github.com/nicknisi/dotfiles/blob/master/install.sh
echo "Installing dotfiles"

echo "Initializing submodule(s)"
git submodule update --init --recursive

if [ "$(uname)" == "Darwin" ]; then
    echo "Running on OSX"

    echo "Brewing all the things"
    source install/brew.sh

    echo "Updating OSX settings"
    source install/osx.sh

    echo "npm settings"
    source install/npm.sh

    echo "pyenv settings"
    source install/pyenv.sh

    echo "pip settings"
    source install/pip.sh

    echo "sbcl settings"
    source install/sbcl.sh

fi

echo "Configuring zsh as default shell"
which zsh
which zsh | pbcopy
echo "add which zsh to /usr/local/bin/zsh"
vi /etc/shells
chsh -s $(which zsh)

echo "rm m4 from emacs term"
mkdir -p ~/.terminfo/65/
cp /usr/share/terminfo/65/eterm ~/.terminfo/65/eterm-color


echo "Done."
