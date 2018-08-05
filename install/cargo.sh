#!/bin/bash

if [ ! -d ~/.cargo/bin ] ;then
    curl https://sh.rustup.rs -sSf | sh
fi
rustup install nightly
rustup default nightly
export PATH="$HOME/.cargo/bin:$PATH"
cargo install cargo-edit
cargo install cargo-script
cargo install cargo-update
cargo install racer
cargo install ripgrep
## rls
rustup update nightly
rustup component add --toolchain=nightly rust-analysis
rustup component add --toolchain=nightly rls-preview
rustup component add --toolchain=nightly rust-src
#rustup run nightly rls