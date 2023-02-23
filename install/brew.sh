#!/usr/bin/env bash
#http://qiita.com/b4b4r07/items/6efebc2f3d1cbbd393fc
# at first install xcode from app store
# xcode-select --install

# Check for Homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."
  # Install the correct homebrew for each OS type
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew doctor
brew update
brew upgrade

# Install homebrew packages
# brewfile使うなら http://tech.basicinc.jp/Mac/2014/04/20/mac_app_engineer/
# brew install aspell
#brew install autojump
# brew install automake
brew install cask
#brew install cmake
# brew install cmigemo
brew install curl
# brew install deno
# brew install elixir
# brew install emojify
# brew install --cocoa emacs
brew install fzf
brew install gcc
brew install ghq
# brew install gibo
brew install git
# brew install global
# brew install go
# brew install haskell-stack
# brew install heroku
# brew install hub
# brew install jq
# brew install llighteiningen
# brew install markdown
# brew install mecab
# brew install mecab-ipadic
# brew install multitail
brew install node
brew install nvm
# brew install poppler # for https://github.com/politza/pdf-tools
# export PKG_CONFIG_PATH=/usr/local/Cellar/zlib/1.2.8/lib/pkgconfig:/usr/local/lib/pkgconfig:/opt/X11/lib/pkgconfig
# brew install postgresql
# brew install pyenv
# brew install pyenv-virtualenv
# brew install mplayer
# brew install rbenv
brew install reattach-to-user-namespace # for tmux on osx
#brew install rust
# brew install sbcl
brew install switchaudio-osx
# brew install the_silver_searcher
brew install tmux
# brew install tree
brew install vim
brew install wget
# brew install youtube-dl
# brew install z
brew install zsh

# brew install ranger
# brew install w3m
# brew install lynx
# brew install highlight
# brew install atool
# brew install mediainfo
# brew install xpdf
# brew install libcaca
# brew install imlib2
# ranger --copy-config=all

# brew install --cask alfred
brew install --cask appcleaner
brew install --cask docker
brew install --cask duet
# brew install --cask dropbox
# brew install --cask evernote
brew install --cask epoccam
# brew install --cask firefox
brew install --cask google-chrome
brew install --cask google-cloud-sdk
# brew install --cask google-japanese-ime
# brew install --cask hyper
brew install --cask iterm2
# brew install --cask warp
brew install --cask slack
brew install --cask mysqlworkbench
# brew install --cask microsoft-teams
brew install --cask shiftit
# brew install --cask the-unarchiver
# brew install --cask virtualbox
# brew install --cask vagrant
# brew install --cask filezilla
brew install --cask visual-studio-code
brew install --cask zoom

brew cleanup

# brew install mas
# mas install 803453959 # Slack
# mas install 497799835 # Xcode
# man install 409183694 # Keynote
