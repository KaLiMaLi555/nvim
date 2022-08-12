return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Themes
	use 'npxbr/gruvbox.nvim'
	use 'dracula/vim'
	use 'marko-cerovac/material.nvim'
	-- Display colors
	use 'chrisbra/Colorizer'
	use 'ap/vim-css-color'

	-- Highlight yanks
	use 'machakann/vim-highlightedyank'

	-- Status Line and Tab Line
	use 'hoob3rt/lualine.nvim'
	use 'romgrk/barbar.nvim'

	-- Random Plugins
	use 'mbbill/undotree'
	use 'tpope/vim-surround'
	use 'jiangmiao/auto-pairs'
	use 'numToStr/Comment.nvim'
	use 'tpope/vim-repeat'
	use 'preservim/tagbar'
	use 'dbeniamine/cheat.sh-vim'
	use 'szw/vim-maximizer'
	use 'dstein64/vim-startuptime'
	use 'ThePrimeagen/vim-be-good'
	use 'sbdchd/neoformat'
	use 'karb94/neoscroll.nvim'

	-- Git Plugins
	use 'mhinz/vim-signify'
	use 'tpope/vim-fugitive'
	use 'tpope/vim-rhubarb'
	use 'junegunn/gv.vim'

	-- Dashboard and sessions
	use 'glepnir/dashboard-nvim'
	use 'goolord/alpha-nvim'
	use 'Shatur/neovim-session-manager'

	-- Beautiful Icons
	use 'ryanoasis/vim-devicons'
	use 'kyazdani42/nvim-web-devicons'

	-- Nvim Tree
	use 'kyazdani42/nvim-tree.lua'

	-- Telescope Plugins
	use 'nvim-lua/popup.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'nvim-telescope/telescope.nvim'
	use 'nvim-telescope/telescope-fzy-native.nvim'
	use 'nvim-telescope/telescope-file-browser.nvim'
	use 'sudormrfbin/cheatsheet.nvim'

	-- Harpoon
	use 'ThePrimeagen/harpoon'

	-- Lsp Plugins
	use 'williamboman/nvim-lsp-installer'
	use 'neovim/nvim-lspconfig'
	use 'glepnir/lspsaga.nvim'
	use 'tjdevries/nlua.nvim'
	use 'onsails/lspkind-nvim'
	use 'tjdevries/complextras.nvim'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-nvim-lua'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/cmp-git'
	use 'tamago324/cmp-zsh'

	-- Snippet Plugins
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'

	-- Treesitter Plugins
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	use 'nvim-treesitter/playground'

end)
