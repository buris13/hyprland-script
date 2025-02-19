#!/bin/bash

#install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source .profile

cargo install wallust

sudo mv "$HOME/.cargo/bin/wallust" /usr/local/bin | ls /usr/local/bin/wallust | echo "wallust installed"

