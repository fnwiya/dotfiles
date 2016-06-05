#!/usr/bin/env bash
#http://qiita.com/b4b4r07/items/6efebc2f3d1cbbd393fc
# at first install xcode from app store
# xcode-select --install

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
brew doctor
brew update
brew upgrade --all

# Install homebrew packages
# brewfile使うなら http://tech.basicinc.jp/Mac/2014/04/20/mac_app_engineer/
brew install aspell
brew install autojump
brew install automake
brew install caskroom/cask/brew-cask
brew install cmigemo
brew install curl
brew install elixir
brew install --cocoa emacs
brew install gcc
brew install gibo
brew install git
brew install global
brew install go
brew install heroku
brew install hub
brew install leiningen
brew install markdown
brew install mecab
brew install mecab-ipadic
brew install multitail
brew install node
brew install nvm
brew install poppler # for https://github.com/politza/pdf-tools
export PKG_CONFIG_PATH=/usr/local/Cellar/zlib/1.2.8/lib/pkgconfig:/usr/local/lib/pkgconfig:/opt/X11/lib/pkgconfig
brew install postgresql
brew install pyenv
brew install pyenv-virtualenv
brew install rbenv
brew install reattach-to-user-namespace # for tmux on osx
brew install sbcl
brew install the_silver_searcher
brew install tmux
brew install tree
brew install vim
brew install wget
brew install z
brew install zsh

brew cask install alfred
brew cask install dropbox
# brew cask install evernote
brew cask install firefox
brew cask install google-chrome
brew cask install google-japanese-ime
brew cask install iterm2
# brew cask install the-unarchiver
brew cask install virtualbox
brew cask install vagrant
brew cask install filezilla

brew cleanup
