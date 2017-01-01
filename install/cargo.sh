#!/bin/bash

if [ -x "`which cargo`" ] ;then
    curl https://sh.rustup.rs -sSf | sh
fi

cargo install cargo-script
cargo install cargo-update
cargo install racer
cargo install rustfmt
