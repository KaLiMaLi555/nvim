if empty(glob('~/.local/share/nvim/site/pack/packer/start/packer.nvim'))
	silent ! git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
	autocmd VimEnter * PackerInstall
endif

" Plugs
lua require("plugins")

" Reloader
source ~/.config/nvim/plug-config/reloader.vim

" Lets
source ~/.config/nvim/configs/lets.vim

" Maps
source ~/.config/nvim/configs/maps.vim

" Autogroups and cmds
source ~/.config/nvim/configs/auto.vim

" Telescope
source ~/.config/nvim/plug-config/telescope.vim

" Vim Git Integrations
source ~/.config/nvim/plug-config/git.vim

" Themes
source ~/.config/nvim/theme/config.vim

" LSP native
source ~/.config/nvim/plug-config/lsp-config.vim

" Harpoon Bindings
source ~/.config/nvim/plug-config/harpoon.vim

lua require("kalimali")
