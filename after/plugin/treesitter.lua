local parser_install_dir = vim.fn.stdpath("data") .. "/treesitter/parsers/"

require'nvim-treesitter.configs'.setup {
	parser_install_dir = parser_install_dir,
	-- A list of parser names, or "all"
	-- ensure_installed = { "python", "c", "lua" },
	ensure_installed = {},

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = false,

	highlight = {
		-- `false` will disable the whole extension
		enable = true,
		additional_vim_regex_highlighting = false,
	},

	incremental_selection = { enable = true },
	textobjects = { enable = true },

	autopairs = {
		enable = true,
	},
}

vim.opt.runtimepath:append(parser_install_dir)
