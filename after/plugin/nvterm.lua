require("nvterm").setup({
	terminals = {
		shell = vim.o.shell,
		list = {},
		type_opts = {
			float = {
				relative = 'editor',
				row = 0.1,
				col = 0.1,
				width = 0.8,
				height = 0.75,
				border = "single",
			},
			horizontal = { location = "rightbelow", split_ratio = .3, },
			vertical = { location = "rightbelow", split_ratio = .55 },
		}
	},
	behavior = {
		autoclose_on_quit = {
			enabled = true,
			confirm = false,
		},
		close_on_exit = true,
		auto_insert = true,
	},
})
