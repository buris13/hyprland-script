#!/bin/bash

mkdir downloads
cd downloads

#FONTS INSTALL
FONTS_URL=(
	"https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz"
	"https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/FantasqueSansMono.zip"
	"https://rubjo.github.io/victor-mono/VictorMonoAll.zip"
)


for f in "${FONTS_URL[@]}"; do
  wget "${f}"
done

 
mkdir -p ~/.local/share/fonts/JetBrainsMonoNerd
mkdir -p ~/.local/share/fonts/VictorMono
mkdir -p ~/.local/share/fonts/FantasqueSansMonoNerd

tar -xJkf JetBrainsMono.tar.xz -C ~/.local/share/fonts/JetBrainsMonoNerd 
unzip -o -q "FantasqueSansMono.zip" -d ~/.local/share/fonts/FantasqueSansMono
unzip -o -q "VictorMonoAll.zip" -d ~/.local/share/fonts/VictorMono

fc-cache -v


#WALLUST INSTALL
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source "$HOME/.profile"

cargo install wallust
sudo mv "$HOME/.cargo/bin/wallust" /usr/local/bin

#SWW INSTALL
swww_tag="v0.9.5"

git clone --recursive -b $swww_tag https://github.com/LGFae/swww.git
cd swww
cargo build --release

sudo cp -r target/release/swww /usr/bin/
sudo cp -r target/release/swww-daemon /usr/bin/

sudo mkdir -p /usr/share/bash-completion/completions
sudo cp -r completions/swww.bash /usr/share/bash-completion/completions/swww 

sudo mkdir -p /usr/share/zsh/site-functions
sudo cp -r completions/_swww /usr/share/zsh/site-functions/_swww

cd ..

#ROFI-WAYLAND INSTALL
rofi_tag="1.7.8+wayland1"

wget https://github.com/lbonn/rofi/releases/download/1.7.8%2Bwayland1/rofi-1.7.8+wayland1.tar.gz
tar xf rofi-$rofi_tag.tar.gz
cd rofi-$rofi_tag

meson setup build
ninja -C build
sudo ninja -C build install

cd ..

#GTK THEMES
git clone --depth 1 https://github.com/JaKooLit/GTK-themes-icons.git
cd GTK-themes-icons
chmod +x auto-extract.sh
./auto-extract.sh

cd ..

#AGS INSTALL
ags_tag="v1.9.0"

git clone --recursive -b "$ags_tag" https://github.com/Aylur/ags.git
cd ags
sudo npm install --global typescript
npm install
meson setup build
sudo meson install -C build

cd ../..



#INPUT GRUP
sudo groupadd input
sudo usermod -aG input "$(whoami)"

#THUNAR
cp -r assets/gtk-3.0 ~/.config
cp -r assets/Thunar ~/.config
cp -r assets/xfce4 ~/.config

#THUNAR DEFAULT
xdg-mime default thunar.desktop inode/directory
xdg-mime default thunar.desktop application/x-wayland-gnome-save-search 
