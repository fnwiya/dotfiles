#!/bin/bash

#参考 https://github.com/nicknisi/dotfiles/blob/master/install.sh
echo "Installing dotfiles"

echo "Initializing submodule(s)"
git submodule update --init --recursive

case ${OSTYPE} in
    darwin*)
        echo "Brewing all the things"
        source install/brew.sh

        echo "Updating OSX settings"
        source install/osx.sh

        echo "rm m4 from emacs term"
        mkdir -p ~/.terminfo/65/
        cp /usr/share/terminfo/65/eterm ~/.terminfo/65/eterm-color
        ;;
    linux*)
        if   [ -e /etc/debian_version ] ||
                 [ -e /etc/debian_release ]; then
            # Check Ubuntu or Debian
            if [ -e /etc/lsb-release ]; then
                # Ubuntu
                distri_name="ubuntu"
                source install/apt-get.sh
                source install/ubuntu.sh
            else
                # Debian
                distri_name="debian"
            fi
        elif [ -e /etc/fedora-release ]; then
            # Fedra
            distri_name="fedora"
        elif [ -e /etc/redhat-release ]; then
            if [ -e /etc/oracle-release ]; then
                # Oracle Linux
                distri_name="oracle"
            else
                # Red Hat Enterprise Linux
                # CentOS
                distri_name="redhat"
            fi
        elif [ -e /etc/SuSE-release ]; then
            # SuSE Linux
            distri_name="suse"
        elif [ -e /etc/gentoo-release ]; then
            # Gentoo Linux
            distri_name="gentoo"
        else
            # Other
            echo "unkown distribution"
            distri_name="unkown"
        fi
        ;;
esac

echo "go settings"
source install/go.sh

echo "npm settings"
source install/npm.sh

echo "pyenv settings"
source install/pyenv.sh

echo "pip settings"
source install/pip.sh

# echo "sbcl settings"
# source install/sbcl.sh

echo "gem settings"
source install/gem.sh

echo "stack settings"
source install/stack.sh

# need interactive
# echo "rust"
# source install/cargo.sh

echo "git settings"
source install/git.sh

echo "Configuring zsh as default shell"
if cat /etc/shells | grep $(which zsh) ; then
    sudo which zsh >> /etc/shells
fi
chsh -s $(which zsh)

echo "Done."
