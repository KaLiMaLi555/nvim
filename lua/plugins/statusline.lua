return {
	{
		"b0o/incline.nvim",
		event = "BufReadPre",
		dependencies = { "nvim-tree/nvim-web-devicons", "rose-pine/neovim" },
		priority = 1200,
		config = function()
			local colors = require("rose-pine.palette")
			require("incline").setup({
				highlight = {
					groups = {
						InclineNormal = { guibg = colors.base },
						InclineNormalNC = { guibg = colors.base },
					}
				},
				window = {
					margin = {
						vertical = 0,
						horizontal = 1
					}
				},
				hide = {
					cursorline = false,
				},
				render = function(props)
					local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
					if vim.bo[props.buf].modified then
						filename = "[+]" .. filename
					end

					local icon, color = require("nvim-web-devicons").get_icon_color(filename)
					return { { icon, guifg = color }, { " " }, { filename } }
				end,
			})
		end,
	},
	{
		"sontungexpt/sttusline",
		branch = "table_version",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		event = { "BufEnter" },
		config = function(_, opts)
			require("sttusline").setup()
		end,
	}
}
