#!/bin/bash

#install liblz4-dev
sudo apt install -y liblz4-dev

#install swww
git clone --recursive -b v0.9.5 https://github.com/LGFae/swww.git && cd swww

cargo build --release

sudo cp -r target/release/swww /usr/bin/ && echo "coppy complete"
sudo cp -r target/release/swww-daemon /usr/bin/ && echo "coppy complete"

#bash completion
sudo mkdir -p /usr/share/bash-completion/completions
sudo cp -r completions/swww.bash /usr/share/bash-completion/completions/swww && echo "move complet"

#zsh completion
sudo mkdir -p /usr/share/zsh/site-functions
sudo cp -r completions/_swww /usr/share/zsh/site-functions/_swww && echo "move complete"


