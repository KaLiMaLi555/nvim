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
require'bufferline'.setup {
	animation = false,
	auto_hide = false,
	tabpages = true,
	closable = true,
	clickable = true,
	exclude_ft = {'javascript'},
	exclude_name = {'package.json'},
	icons = true,
	icon_custom_colors = true,
	icon_separator_active = ' ',
	icon_separator_inactive = ' ',
	icon_close_tab = '',
	icon_close_tab_modified = '●',
	icon_pinned = '車',
	insert_at_end = false,
	insert_at_start = false,
	maximum_padding = 1,
	maximum_length = 10,
	semantic_letters = true,
	letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
	no_name_title = nil,
}
