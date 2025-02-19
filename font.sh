#!/bin/bash

#font from apt
sudo apt install -y curl fonts-firacode fonts-font-awesome fonts-noto fonts-noto-cjk fonts-noto-color-emoji

#font jetbrains for waybar
DOWNLOAD_URL="https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz"

curl -OL $DOWNLOAD_URL

rm -rf ~/.local/share/fonts/JetBrainsMonoNerd

mkdir -p ~/.local/share/fonts/JetBrainsMonoNerd

tar -xJkf JetBrainsMono.tar.xz -C ~/.local/share/fonts/JetBrainsMonoNerd

fc-cache -v
