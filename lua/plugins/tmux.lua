return {
	"christoomey/vim-tmux-navigator",
	cmd = {
		"TmuxNavigateLeft",
		"TmuxNavigateRight",
		"TmuxNavigateUp",
		"TmuxNavigateDown",
		"TmuxNavigatePrevious",
	},
	keys = {
		{ "<C-h>", "<Cmd>TmuxNavigateLeft<CR>" },
		{ "<C-j>", "<Cmd>TmuxNavigateDown<CR>" },
		{ "<C-k>", "<Cmd>TmuxNavigateUp<CR>" },
		{ "<C-l>", "<Cmd>TmuxNavigateRight<CR>" },
		{ "<C-space>", "<Cmd>TmuxNavigatePrevious<CR>" },
	},
}
