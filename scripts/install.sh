## Updating system
update_sys()
{
    sudo apt-get update -y
    sudo apt-get upgrade -y
}


# Ensuring snap is installed for neovim install
update_sys
sudo apt install snapd

sudo snap install --edge nvim --classic
sudo apt install python3-neovim

chmod +x setuplsp.sh
./setuplsp.sh

nvim -c "PlugInstall" -c "q" -c "q"
