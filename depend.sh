#!/bin/bash
#build dependencies
sudo apt install -y build-essential cmake cmake-extras curl gawk gettext git glslang-tools gobject-introspection golang hwdata jq libmpdclient-dev libnl-3-dev libasound2-dev libstartup-notification0-dev libwayland-client++1 libwayland-dev libcairo-5c-dev libcairo2-dev libsdbus-c++-bin libegl-dev libegl1-mesa-dev libpango1.0-dev libgdk-pixbuf-2.0-dev libxcb-keysyms1-dev libwayland-client0 libxcb-ewmh-dev libxcb-cursor-dev libxcb-icccm4-dev libxcb-randr0-dev libxcb-render-util0-dev libxcb-util-dev libxcb-xkb-dev libxcb-xinerama0-dev libxkbcommon-dev libxkbcommon-x11-dev meson ninja-build openssl psmisc python3-mako python3-markdown python3-markupsafe python3-yaml python3-pyquery qt6-base-dev spirv-tools vulkan-utility-libraries-dev wayland-protocols xdg-desktop-portal xwayland bc

sudo apt build-dep wlroots

#uninnstall conflict
sudo apt autoremove -y dunst mako rofi cargo

#hyprland dependencies
sudo apt install -y cliphist grim gvfs gvfs-backends inxi imagemagick kitty nano nwg-look pavucontrol playerctl polkit-kde-agent-1 pkexec python3-requests python3-pip qt5ct qt5-style-kvantum qt5-style-kvantum-themes qt6ct slurp sway-notification-center swappy waybar wget wl-clipboard wlogout xdg-user-dirs xdg-utils yad

#hyprland dependencies 2
sudo apt install -y brightnessctl btop cava eog fastfetch gnome-system-monitor mousepad mpv mpv-mpris nvtop pamixer qalculate-gtk vim yad

sudo apt install -y yad


