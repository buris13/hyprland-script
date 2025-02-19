#!/bin/bash
#dep
sudo apt install -y libpam0g-dev libgbm-dev libdrm-dev  libmagic-dev  libhyprlang-dev  libhyprutils-dev libsdbus-c++-dev

#specific branch or release
lock_tag="v0.1.4"

if git clone --recursive -b $lock_tag https://github.com/hyprwm/hypridle.git; then
	cd hypridle || exit 1
	cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -S . -B ./build
	cmake --build ./build --config Release --target hypridle -j`nproc 2>/dev/null || getconf _NPROCESSORS_CONF`
	if sudo cmake --install build ; then
		printf "Ok, HYPRLOCK INSTALLED"
	else
		echo -e "Installation failed"
	fi
else
	echo -e "Download Failed"
fi
