#!/bin/bash

source_theme="https://codeberg.org/JaKooLit/sddm-sequoia"
theme_name="sequoia_2"


sudo apt install --no-install-recommends sddm

sudo systemctl enable sddm

sudo mkdir -p /usr/share/wayland-sessions
sudo cp ../assets/hyprland.desktop /usr/share/wayland-sessions/
#cd downloads

#SDDM THEME
#source_theme="https://codeberg.org/JaKooLit/sddm-sequoia"
#theme_name="sequoia_2"

#git clone --depth 1 "$source_theme" "$theme_name"
#sudo mkdir -p /usr/share/sddm/themes
#sudo mv "$theme_name" "/usr/share/sddm/themes/$theme_name"

