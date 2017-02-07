#!/bin/bash

gem install sqlint
gem install tw
gem install tmuxinator
wget https://raw.github.com/aziz/tmuxinator/master/completion/tmuxinator.zsh
mkdir -p ~/.tmuxinator
mv tmuxinator.zsh ~/.tmuxinator/
