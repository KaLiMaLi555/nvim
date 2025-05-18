return {
	left = { "mark", "sign" },
	right = { "fold", "git" },
	folds = {
		open = false, -- show open fold icons
		git_hl = false, -- use Git Signs hl for fold icons
	},
	git = {
		-- patterns to match Git signs
		patterns = { "GitSign", "MiniDiffSign" },
	},
	refresh = 50
}
