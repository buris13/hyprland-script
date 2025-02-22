#!/bin/bash

root_link="https://github.com/hyprwm/"
repo=(
        hyprwayland-scanner
        hyprutils
        aquamarine
        hyprlang
        hyprcursor
        hyprgraphics
        hyprland-protocols
        hyprlock
        hypridle
        xdg-desktop-portal-hyprland
        Hyprland
        hyprland-qtutils
)

#clone all repo
mkdir repo
cd repo
for r in "${repo[@]}"; do
  git clone --recursive "${root_link}${r}"
done

#INSTALL HYPRWAYLAND-SCANNER
cd ${repo[0]}
cmake -DCMAKE_INSTALL_PREFIX=/usr -B build
cmake --build build -j `nproc`
sudo cmake --install build
cd ..

#INSTALL HYPRUTILS
cd ${repo[1]}
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf NPROCESSORS_CONF`
sudo cmake --install build
cd ..

#INSTALL AQUAMARINE
cd ${repo[2]}
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf _NPROCESSORS_CONF`
sudo cmake --install build
cd ..

#INSTALL HYPRLANG
cd ${repo[3]}
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target hyprlang -j`nproc 2>/dev/null || getconf _NPROCESSORS_CONF`
sudo cmake --install ./build
cd ..

#INSTALL HYPRCURSOR
cd ${repo[4]}
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf _NPROCESSORS_CONF`
sudo cmake --install build
cd ..

#INSTALL HYPRGRAPHICS
cd ${repo[5]}
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf NPROCESSORS_CONF`
sudo cmake --install build
cd ..

#INSTALL HYPRLAND-PROTOCOLS
cd ${repo[6]}
meson setup build
meson compile -C build
sudo meson install -C build
cd ..

#INSTALL HYPRLOCK
cd ${repo[7]}
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -S . -B ./build
cmake --build ./build --config Release --target hyprlock -j`nproc 2>/dev/null || getconf _NPROCESSORS_CONF`
sudo cmake --install build
cd ..

#INSTALL HYPRIDLE
cd ${repo[8]} 
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -S . -B ./build
cmake --build ./build --config Release --target hypridle -j`nproc 2>/dev/null || getconf _NPROCESSORS_CONF`
sudo cmake --install build
cd ..

#INSTALL XDPH
cd ${repo[9]}
cmake -DCMAKE_INSTALL_LIBEXECDIR=/usr/lib -DCMAKE_INSTALL_PREFIX=/usr -B build
cmake --build build
sudo cmake --install build
cd ..

#INSTALL HYPRLAND
cd ${repo[10]}
make all
sudo make install
cd ..

#INSTALL HYPRLAND-QTUTILS
cd ${repo[11]}
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf NPROCESSORS_CONF`
sudo cmake --install build

