#!/bin/bash

if [ ! -d ~/.cargo/bin ] ;then
    curl https://sh.rustup.rs -sSf | sh
fi
# rustup install beta
rustup install nighly
# rustup default nighly
export PATH="$HOME/.cargo/bin:$PATH"
cargo install cargo-edit
cargo install cargo-script
cargo install cargo-update
cargo install racer
cargo install ripgrep
