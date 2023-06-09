-- vim.g.copilot_no_tab_map = true
-- vim.g.copilot_assume_mapped = true
--
-- vim.cmd[[highlight CopilotSuggestion ctermfg=8 guifg=white guibg=#5c6370]]
require('copilot').setup({
	panel = {
		enabled = false,
		auto_refresh = false,
	},
	suggestion = {
		enabled = true,
		auto_trigger = true,
		debounce = 75,
		keymap = {
			accept = "<Tab>",
			accept_word = "<C-w>",
			accept_line = false,
			next = "<C-]>",
			prev = "<C-[",
			dismiss = "<C-c>",
		},
	},
	filetypes = {
		yaml = false,
		markdown = false,
		help = false,
		gitcommit = false,
		gitrebase = false,
		hgcommit = false,
		svn = false,
		cvs = false,
		["."] = false,
	},
	copilot_node_command = 'node', -- Node.js version must be > 16.x
	server_opts_overrides = {},
})
