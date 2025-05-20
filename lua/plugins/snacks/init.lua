return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@diagnostic disable-next-line: undefined-doc-name
		---@type snacks.Config
		opts = {
			dashboard = require("plugins.snacks.dashboard"),
			lazygit = require("plugins.snacks.lazygit"),
			statuscolumn = require("plugins.snacks.statuscolumn"),
		},
		keys = {
			{ "<localleader>g", function() Snacks.lazygit() end },
		}
	},
}
