#!/bin/bash

# This installs Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > rust_install.sh && chmod u+x rust_install.sh && ./rust_install.sh -y
. "$HOME/.cargo/env"

rustup show
cargo build --locked --release

./targest/release/avail-node --dev --enable-kate-rpc &
sleep 5
cd e2e
cargo test -- --test-threads 1