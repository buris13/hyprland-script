#!/usr/bin/bash

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
        hyprland-qt-support
)

Help() {
    cat << EOF
For Upgrade Hyprland

usage:
update.sh --[options]

Options:
  --help			show help message
  --update-all			update all
  --update-hyprland		update hyprland only
  --update-repo			update hyprland repo only
  --check-branch		check branch
EOF
}

Update-repo() {
  for r in "${repo[@]}"; do
    cd "${r}" && git pull && cd ..
  done
}

Check-branch() {
  for r in "${repo[@]}"; do
    cd ${r} && echo ${r} &&  git branch && cd ..
  done
}

Remove-build-dir()  {
for r in "${repo[@]}"; do
  rm -rf ${r}/build
#  ls -lah ${r}/build
done
}

Update-all-bin() {
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
cd ..

#INSTALL HYPRLAND-QT-SUPPORT
cd ${repo[12]}
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -DINSTALL_QML_PREFIX=/lib/qt6/qml -S . -B ./build
cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf NPROCESSORS_CONF`
sudo cmake --install build
}


Update-all(){
  Remove-build-dir
  Update-repo
  Update-all-bin
}

Update-Hyprland(){
  cd ${repo[10]}
  rm -rf build
  git pull
  make all
  sudo make install
  cd ..
}




if [[ "$1" == "--help" ]]; then
	Help
elif [[ "$1" == "--update-all" ]]; then
	Update-all
elif [[ "$1" == "--update-repo" ]]; then
	Update-repo
elif [[ "$1" == "--check-branch" ]]; then
	Check-branch
elif [[ "$1" == "--update-hyprland" ]]; then
	Update-Hyprland
else
	Help
fi

exit 0
