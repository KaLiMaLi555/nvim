#!/bin/bash

curl -fsSL https://deb.nodesource.com/setup_15.x | sudo -E bash -
sudo apt-get install -y nodejs

sudo apt-get install ccls
sudo npm i -g pyright
sudo npm i -g bash-language-server
sudo npm i -g clangd
