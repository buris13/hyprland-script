#!/bin/sh
sudo apt install unzip gtk2-engines-murrine

git clone --depth 1 https://github.com/JaKooLit/GTK-themes-icons.git
cd GTK-themes-icons
chmod +x auto-extract.sh
./auto-extract.sh
cd ..
