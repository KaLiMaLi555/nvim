return {
	{
		"folke/snacks.nvim",
		---@type snacks.Config
		opts = {
			dashboard = require("plugins.snacks.dashboard"),
			lazygit = require("plugins.snacks.lazygit"),
			statuscolumn = require("plugins.snacks.statuscolumn"),
		},
	},
}
