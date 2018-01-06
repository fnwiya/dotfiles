#!/bin/bash

mkdir -p ~/.local/bin
cd ~/.local/bin
wget https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
chmod +x ~/.local/bin/lein
lein
