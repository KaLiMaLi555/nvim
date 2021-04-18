#!/bin/bash

curl -fsSL https://deb.nodesource.com/setup_15.x | sudo -E bash -
sudo apt-get install -y nodejs

# Installing Lua Language Server
sudo apt-get install -y ninja-build
git clone https://github.com/sumneko/lua-language-server ~/.config/nvim/plugged/lua-language-server
cd ~/.config/nvim/plugged/lua-language-server
git submodule update --init --recursive
cd 3rd/luamake
./compile/install.sh
cd ../..
./3rd/luamake/luamake rebuild
cd ~/.config/nvim/scripts

sudo apt-get install ccls
sudo npm i -g pyright
sudo npm i -g bash-language-server
sudo npm i -g clangd
