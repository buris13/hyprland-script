#!/bin/bash

mkdir downloads
cd downloads 

sudo apt install eza zsh zplug

sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended || true

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions || true

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting || true

cp -r '../assets/.zshrc' ~/
cp -r '../assets/.zprofile' ~/

cp -r ../assets/add_zsh_theme/* ~/.oh-my-zsh/themes

chsh -s $(which zsh)
