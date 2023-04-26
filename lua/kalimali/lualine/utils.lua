M = {}

-- Color table for highlights
local colors = {
	-- bg = '#202328',
	-- bg = '#1d2021',
	bg = '#16000a',
	-- bg = '#000000',
	fg = '#bbc2cf',
	yellow = '#ECBE7B',
	cyan = '#008080',
	darkblue = '#081633',
	green = '#98be65',
	orange = '#FF8800',
	violet = '#a9a1e1',
	magenta = '#c678dd',
	blue = '#51afef',
	red = '#ec5f67'
}

local conditions = {
	buffer_not_empty = function() return vim.fn.empty(vim.fn.expand('%:t')) ~= 1 end,
	hide_in_width = function() return vim.fn.winwidth(0) > 80 end,
	check_git_workspace = function()
		local filepath = vim.fn.expand('%:p:h')
		local gitdir = vim.fn.finddir('.git', filepath .. ';')
		return gitdir and #gitdir > 0 and #gitdir < #filepath
	end
}

M.mode_color = {
	n      = colors.red,
	i      = colors.green,
	v      = colors.blue,
	[''] = colors.blue,
	V      = colors.blue,
	c      = colors.magenta,
	no     = colors.red,
	s      = colors.orange,
	S      = colors.orange,
	[''] = colors.orange,
	ic     = colors.yellow,
	R      = colors.violet,
	Rv     = colors.violet,
	cv     = colors.red,
	ce     = colors.red,
	r      = colors.cyan,
	rm     = colors.cyan,
	['r?'] = colors.cyan,
	['!']  = colors.red,
	t      = colors.red
}

M.mode_text = {
	n      = 'NORMAL',
	i      = 'INSERT',
	v      = 'VISUAL',
	['^V'] = 'VBLOCK',
	V      = 'VLINE',
	r      = 'REPLACE',
	R      = 'REPLACE',
	t      = 'TERMINAL',
	c      = 'COMMAND',
}

-- Default Configs
M.default_config = {
	options = {
		component_separators = "",
		section_separators = "",
		theme = {
			normal = {c = {fg = colors.fg, bg = colors.bg}},
			inactive = {c = {fg = colors.fg, bg = colors.bg}}
		}
	},
	sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {},
		lualine_x = {}
	},
}

-- Inserts a component in lualine_c at left section
M.ins_left = function (conf, component)
	table.insert(conf.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
M.ins_right =  function (conf, component)
	table.insert(conf.sections.lualine_x, component)
end

M.ins_delim = {
	function() return '▊' end,
	color = {fg = colors.blue},
	left_padding = 0
}

M.ins_section = {
	function()
		return '%='
	end
}

M.show_mode = {
	-- mode component
	function()
		-- auto change color according to neovims mode
		local mode_color = M.mode_color
		local mode_text  = M.mode_text
		vim.api.nvim_command(
			'hi! LualineMode guifg=' .. mode_color[vim.fn.mode()] .. " guibg=" ..
			colors.bg)
		return string.format(' %-7s', mode_text[vim.fn.mode()])
	end,
	color = "LualineMode",
	left_padding = 1,
}

M.show_git_branch = {
	'branch',
	icon = '',
	condition = conditions.check_git_workspace,
	color = {fg = colors.violet, gui = 'bold'},
	left_padding = 0
}

M.show_filename = {
	'filename',
	condition = conditions.buffer_not_empty,
	color = {fg = colors.magenta, gui = 'bold'},
	path = 1,
	left_padding = 2
}

M.show_filesize = {
	-- filesize component
	function()
		local function format_file_size(file)
			local size = vim.fn.getfsize(file)
			if size <= 0 then return '' end
			local sufixes = {'b', 'k', 'm', 'g'}
			local i = 1
			while size > 1024 do
				size = size / 1024
				i = i + 1
			end
			return string.format('%.1f%s', size, sufixes[i])
		end
		local file = vim.fn.expand('%:p')
		if string.len(file) == 0 then return '' end
		return format_file_size(file)
	end,
	condition = conditions.buffer_not_empty
}

M.show_lspserver ={
	-- Lsp server name .
	function()
		local msg = 'No Active Lsp'
		local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
		local clients = vim.lsp.get_active_clients()
		if next(clients) == nil then return msg end
		for _, client in ipairs(clients) do
			local filetypes = client.config.filetypes
			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
				return client.name
			end
		end
		return msg
	end,
	icon = ' LSP:',
	color = {fg = '#ffffff', gui = 'bold'}
}

M.show_lspdiagnostics = {
	'diagnostics',
	sources = {'nvim_lsp'},
	symbols = {error = ' ', warn = ' ', info = ' '},
	color_error = colors.red,
	color_warn = colors.yellow,
	color_info = colors.cyan
}

M.show_encoding = {
	'o:encoding', -- option component same as &encoding in viml
	upper = true, -- I'm not sure why it's upper case either ;)
	condition = conditions.hide_in_width,
	color = {fg = colors.green, gui = 'bold'}
}

M.show_fileformat = {
	'fileformat',
	upper = true,
	icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
	color = {fg = M.green, gui = 'bold'}
}

M.show_git_diff = {
	'diff',
	-- Is it me or the symbol for modified us really weird
	symbols = {added = ' ', modified = '柳 ', removed = ' '},
	color_added = colors.green,
	color_modified = colors.orange,
	color_removed = colors.red,
	condition = conditions.hide_in_width
}

M.show_progress = {
	'progress',
	color = {
		fg = colors.fg,
		gui = 'bold'
	}
}

M.show_location = {
	'location'
}


return M
