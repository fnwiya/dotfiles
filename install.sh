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
                source install/peco4linux.sh
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
        elif [ -e /etc/turbolinux-release ]; then
            # Turbolinux
            distri_name="turbol"
        elif [ -e /etc/SuSE-release ]; then
            # SuSE Linux
            distri_name="suse"
        elif [ -e /etc/mandriva-release ]; then
            # Mandriva Linux
            distri_name="mandriva"
        elif [ -e /etc/vine-release ]; then
            # Vine Linux
            distri_name="vine"
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

echo "npm settings"
source install/npm.sh

echo "pyenv settings"
source install/pyenv.sh

echo "pip settings"
source install/pip.sh

echo "sbcl settings"
source install/sbcl.sh

echo "Configuring zsh as default shell"
which zsh
which zsh | pbcopy
echo "add which zsh to /usr/local/bin/zsh"
vi /etc/shells
chsh -s $(which zsh)

echo "Done."
