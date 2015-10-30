#!/usr/bin/env bash
#http://qiita.com/b4b4r07/items/6efebc2f3d1cbbd393fc

# Check for Homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."

  # Install the correct homebrew for each OS type
  if test "$(uname)" = "Darwin"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  elif test "$(expr substr $(uname -s) 1 5)" = "Linux"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/linuxbrew/go/install)"
  fi

fi

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install homebrew packages
brew install tern
aspell                  htop-osx                peco
autoconf                jpeg                    pixman
bdw-gc                  leiningen               pkg-config
brew-cask               libffi                  postgresql
cmigemo                 libsigsegv              pyenv
ctags                   libtasn1                pyenv-virtualenv
gdbm                    makedepend              qemu
gettext                 mecab                   readline
git                     multimarkdown           w3m
glib                    nasm                    xz
global                  nettle                  z
gmp                     nkf                     zsh
gnutls                  node                    zsh-completions
go                      openssl
goaccess                pcre
nvm rbenv
exit 0
