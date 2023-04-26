local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	-- Colorscheme
	{
		'rose-pine/neovim',
		lazy = false
	},
	{
		'tjdevries/colorbuddy.nvim'
	},

	-- Misc
	{
		'numToStr/Comment.nvim',
		lazy = false
	},
	{
		'nvim-tree/nvim-tree.lua',
		dependencies = {
			'nvim-tree/nvim-web-devicons',
		},
		tag = 'nightly',
		lazy = false
	},
	{
		'windwp/nvim-autopairs'
	},
	{
		'mbbill/undotree'
	},
	{
		'ThePrimeagen/harpoon'
	},
	{
		'tpope/vim-surround',
	},
	{
		'tpope/vim-repeat'
	},
	{
		'ggandor/leap.nvim'
	},
	{
		'VonHeikemen/fine-cmdline.nvim',
		dependencies = {
			{'MunifTanjim/nui.nvim'}
		}
	},
	{
		'dstein64/vim-startuptime'
	},

	-- Telescope
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.0',
		dependencies = { {'nvim-lua/plenary.nvim'} },
		lazy = false
	},
	{
		'nvim-telescope/telescope-fzy-native.nvim',
	},
	{
		'nvim-telescope/telescope-file-browser.nvim',
	},
	{
		"nvim-telescope/telescope-frecency.nvim",
		dependencies = {"kkharji/sqlite.lua"}
	},

	-- Treesitter
	{
		'nvim-treesitter/nvim-treesitter',
		lazy = false
	},
	{
		'nvim-treesitter/nvim-treesitter-context',
		lazy = false
	},
	{
		'nvim-treesitter/playground',
	},

	-- LSP
	{
		'VonHeikemen/lsp-zero.nvim',
		dependencies = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-nvim-lua'},

			-- Snippets
			{'L3MON4D3/LuaSnip'},
			{'rafamadriz/friendly-snippets'},
		}
	},
	{
		'github/copilot.vim'
	},

	-- Git
	{
		'lewis6991/gitsigns.nvim',
	},
	-- Neogit
	{
		'TimUntersberger/neogit',
		lazy = false
	},

	-- Statusline
	{
		'hoob3rt/lualine.nvim',
		lazy = false
	},

	-- bufferline and dependencies and scope
	{
		'akinsho/bufferline.nvim',
		dependencies = {
			'nvim-tree/nvim-web-devicons',
		},
		lazy = false
	},
	{
		'tiagovla/scope.nvim',
		lazy = false
	},

	-- Nvterm
	{
		'NvChad/nvterm',
	},

	-- Alpha
	{
		'goolord/alpha-nvim',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'sindrets/diffview.nvim'
		},
		lazy = false
	}

}

local opts = {}

require('lazy').setup(plugins, opts)
