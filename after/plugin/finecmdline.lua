require('fine-cmdline').setup({
	cmdline = {
		enable_keymaps = true,
		smart_history = true,
		prompt = " :"
	},
	popup = {
		position = {
			row = '20%',
			col = '50%',
		},
		size = {
			height = '40%',
			width = '60%',
		},
		border = {
			style = 'rounded',
		},
		win_options = {
			winhighlight = 'Normal:Normal,FloatBorder:None',
		},
	},
})
