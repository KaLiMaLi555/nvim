local neogit = require('neogit')

neogit.setup {
	disable_signs = false,
	disable_hint = false,
	disable_context_highlighting = false,
	disable_commit_confirmation = true,
	-- Neogit refreshes its internal state after specific events, which can be expensive depending on the repository size.
	-- Disabling `auto_refresh` will make it so you have to manually refresh the status after you open it.
	auto_refresh = true,
	-- Value used for `--sort` option for `git branch` command
	-- By default, branches will be sorted by commit date descending
	-- Flag description: https://git-scm.com/docs/git-branch#Documentation/git-branch.txt---sortltkeygt
	-- Sorting keys: https://git-scm.com/docs/git-for-each-ref#_options
	sort_branches = "-committerdate",
	disable_builtin_notifications = false,
	use_magit_keybindings = false,
	-- Change the default way of opening neogit
	kind = "floating",
	-- The time after which an output console is shown for slow running commands
	console_timeout = 2000,
	-- Automatically show console if a command takes more than console_timeout milliseconds
	auto_show_console = true,
	-- Persist the values of switches/options within and across sessions
	remember_settings = true,
	-- Scope persisted settings on a per-project basis
	use_per_project_settings = true,
	-- Array-like table of settings to never persist. Uses format "Filetype--cli-value"
	--   ie: `{ "NeogitCommitPopup--author", "NeogitCommitPopup--no-verify" }`
	ignored_settings = {},
	-- Change the default way of opening the commit popup
	commit_popup = {
		kind = "floating",
	},
	-- Change the default way of opening the preview buffer
	preview_buffer = {
		kind = "floating",
	},
	-- Change the default way of opening popups
	popup = {
		kind = "floating",
	},
	-- customize displayed signs
	signs = {
		-- { CLOSED, OPENED }
		section = { ">", "v" },
		item = { ">", "v" },
		hunk = { "", "" },
	},
	integrations = {
		diffview = true
	},
	-- Setting any section to `false` will make the section not render at all
	sections = {
		untracked = {
			folded = true
		},
		unstaged = {
			folded = false
		},
		staged = {
			folded = false
		},
		stashes = {
			folded = true
		},
		unpulled = {
			folded = true
		},
		unmerged = {
			folded = false
		},
		recent = {
			folded = true
		},
	},
}

local c = require("colorbuddy.color").colors
local Group = require("colorbuddy.group").Group

Group.new("GitSignsAdd", c.green)
Group.new("GitSignsChange", c.yellow:dark())
Group.new("GitSignsDelete", c.red:dark())

local giticons = {
	-- added = "██",
	-- change = "██",
	-- delete = "██",
	added = "▐",
	change = "▐",
	delete = "▐",
}

require('gitsigns').setup {
	signs = {
		add = { hl = "GitSignsAdd", text = giticons.added, numhl = "GitSignsAddNr" },
		change = { hl = "GitSignsChange", text = giticons.change, numhl = "GitSignsChangeNr" },
		delete = { hl = "GitSignsDelete", text = giticons.delete, numhl = "GitSignsDeleteNr" },
		topdelete = { hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr" },
		changedelete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsChangeNr" },
		untracked = { text = giticons.added },
	},
}



