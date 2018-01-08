#!/bin/bash

if [ ! -f ~/.local/bin/lein ] ;then
    mkdir -p ~/.local/bin
    cd ~/.local/bin
    wget https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
fi
chmod +x ~/.local/bin/lein
~/.local/bin/lein
