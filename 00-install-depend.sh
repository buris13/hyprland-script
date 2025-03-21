#!/bin/bash

sudo apt install vim timeshift git git build-essential cmake cmake-extras curl gawk gettext git glslang-tools gobject-introspection golang hwdata jq libmpdclient-dev libnl-3-dev libasound2-dev libstartup-notification0-dev libwayland-client++1 libwayland-dev libcairo-5c-dev libcairo2-dev libsdbus-c++-bin libegl-dev libegl1-mesa-dev libpango1.0-dev libgdk-pixbuf-2.0-dev libxcb-keysyms1-dev libwayland-client0 libxcb-ewmh-dev libxcb-cursor-dev libxcb-icccm4-dev libxcb-randr0-dev libxcb-render-util0-dev libxcb-util-dev libxcb-xkb-dev libxcb-xinerama0-dev libxkbcommon-dev libxkbcommon-x11-dev meson ninja-build openssl psmisc python3-mako python3-markdown python3-markupsafe python3-yaml python3-pyquery qt6-base-dev spirv-tools vulkan-utility-libraries-dev wayland-protocols xdg-desktop-portal xwayland bc libpugixml-dev libseat-dev libinput-dev libdrm-dev libdrm-radeon1 libdrm-amdgpu1 libgbm-dev libdisplay-info-dev libzip-dev librsvg2-dev libtomlplusplus-dev libmagic-dev libspng-dev libjxl-dev libjxl-tools libxcursor-dev libre2-dev libvpoll-dev libxcb-xfixes0-dev libxcb-composite0-dev libxcb-res0-dev libxcb-errors-dev cliphist grim gvfs gvfs-backends inxi imagemagick kitty nano nwg-look pavucontrol playerctl polkit-kde-agent-1 pkexec python3-requests python3-pip qt5ct qt5-style-kvantum qt5-style-kvantum-themes qt6ct slurp sway-notification-center swappy waybar wget wl-clipboard wlogout xdg-user-dirs xdg-utils yad brightnessctl btop cava eog fastfetch gnome-system-monitor mousepad mpv mpv-mpris nvtop pamixer qalculate-gtk libsdbus-c++-dev libpam0g-dev curl fonts-firacode fonts-font-awesome fonts-noto fonts-noto-cjk fonts-noto-color-emoji liblz4-dev bison flex pandoc doxygen cppcheck libmpdclient-dev libnl-3-dev libasound2-dev libstartup-notification0-dev libwayland-client++1 libwayland-dev libcairo-5c-dev libcairo2-dev libpango1.0-dev libgdk-pixbuf-2.0-dev libxcb-keysyms1-dev libwayland-client0 libxcb-ewmh-dev libxcb-cursor-dev libxcb-icccm4-dev libxcb-randr0-dev libxcb-render-util0-dev libxcb-util-dev libxcb-xkb-dev libxcb-xinerama0-dev libxkbcommon-dev libxkbcommon-x11-dev ohcount wget unzip gtk2-engines-murrine bluez blueman ffmpegthumbnailer thunar thunar-volman tumbler thunar-archive-plugin xarchiver  meson libgjs-dev gjs libgtk-layer-shell-dev libgtk-3-dev libpam0g-dev libpulse-dev libdbusmenu-gtk3-dev libsoup-3.0-dev qml6-module-qt5compat-graphicaleffects qt6-declarative-dev qt6-svg-dev qt6-base-dev qt6-declarative-private-dev qt6-wayland-dev qt6-wayland-private-dev qml6-module-qtwayland-compositor qml6-module-qtcore  qml6-module-qtqml-workerscript  qml6-module-qtqml-models  qml6-module-qtquick  qml6-module-qtquick-controls  qml6-module-qtquick-layouts  qml6-module-qtquick-templates  qml6-module-qtquick-window  libqt6quick6 firefox-esr network-manager-gnome libpipewire-0.3-dev libspa-0.2-dev libnotify-bin copyq ufw

sudo apt build-dep wlroots

sudo apt build-dep pam

sudo apt install --no-install-recommends qml-module-qtquick-layouts qml-module-qtquick-controls2 libqt6svg6

#extra
sudo apt install inkscape remmina obs-studio pipewire

#bluetooth not working after install pipewire
sudo apt install libspa-0.2-bluetooth && sudo apt autoremove pulseaudio-module-bluetooth



#fix backlight mute key t14
sudo apt install alsa-utils #open alsamixer

#sudo systemctl enable bluetooth.service


