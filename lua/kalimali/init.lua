require('kalimali.globals')
require("kalimali.telescope")
require("kalimali.lsp-config")
require('kalimali.lualine')
require('kalimali.harpoon')
require('kalimali.snippets')
-- require("kalimali.compe-config")
require('nvim-treesitter.configs').setup {
	highlight = {
		enable = true,
		disable = {},
	},
	indent = {
		enable = true,
		disable = {},
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		}
	},
	ensure_installed = {
		"bash",
		"c",
		"cmake",
		"cpp",
		"cuda",
		"lua",
		"html",
		"python",
		"lua",
	}
}
require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = {
		adaptive_size = true,
		mappings = {
			list = {
				{ key = "u", action = "dir_up" },
			},
		},
		side = "right"
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
})
