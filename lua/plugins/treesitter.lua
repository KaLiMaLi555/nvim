return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function () 
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = {
					"bash",
					"c",
					"cpp",
					"lua",
					"python",
					"vim",
					"yaml",
					"markdown",
					"json",
					"html",
					"css",
					"javascript",
					"typescript",
				},
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
				additional_vim_regex_highlighting = false,
			})
		end
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
	},
}
