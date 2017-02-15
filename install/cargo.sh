#!/bin/bash

if [ -d ~/.cargo/bin ] ;then
    curl https://sh.rustup.rs -sSf | sh
fi

cargo install cargo-edit
cargo install cargo-script
cargo install cargo-update
cargo install racer
cargo install ripgrep
cargo install rustfmt
