#!/bin/bash
#install dependencies
sudo apt install -y bison flex pandoc doxygen cppcheck libmpdclient-dev libnl-3-dev libasound2-dev libstartup-notification0-dev libwayland-client++1 libwayland-dev libcairo-5c-dev libcairo2-dev libpango1.0-dev libgdk-pixbuf-2.0-dev libxcb-keysyms1-dev libwayland-client0 libxcb-ewmh-dev libxcb-cursor-dev libxcb-icccm4-dev libxcb-randr0-dev libxcb-render-util0-dev libxcb-util-dev libxcb-xkb-dev libxcb-xinerama0-dev libxkbcommon-dev libxkbcommon-x11-dev ohcount wget

#install rofi wayland
wget https://github.com/lbonn/rofi/releases/download/1.7.8%2Bwayland1/rofi-1.7.8+wayland1.tar.gz
tar -xf rofi-1.7.8+wayland1.tar.gz
cd rofi-1.7.8+wayland1
meson setup build && ninja -C build
sudo ninja -C build install

