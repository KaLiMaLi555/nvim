local yankgrp = vim.api.nvim_create_augroup("YankHighLight", { clear = true })
vim.api.nvim_create_autocmd(
"TextYankPost",
{
	command="silent! lua vim.highlight.on_yank({timeout=40})",
	group = yankgrp
}
)

local sessiongrp = vim.api.nvim_create_augroup("SessionManager", { clear = true })
vim.api.nvim_create_autocmd(
{"BufEnter"},
{
	callback = function()
		if vim.bo.filetype ~= "alpha" then
			require("kalimali.sessions").save_current_session()
		end
	end,
	group = sessiongrp
}
)
