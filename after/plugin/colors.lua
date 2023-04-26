require('rose-pine').setup({
	disable_background = true
})


function ColorScheme(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
	vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
	vim.api.nvim_set_hl(0, "SignColumn", { bg = "none"})
	vim.api.nvim_set_hl(0, "TreesitterContextBottom", { bg = "#2b0014"})
	-- Highlight fix for gitsigns
	vim.api.nvim_set_hl(0, "SignColumn", { bg = "none"})
	-- Highlight fix for leap.nvim
	vim.api.nvim_set_hl(0, 'Cursor', { reverse = true })
end

ColorScheme('rose-pine')
