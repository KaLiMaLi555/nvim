local lualine = require 'lualine'
local bufferline = require 'bufferline'
local utils = require 'kalimali.lualine.utils'


-- LUALINE CONFIGS
-- Default Configs
local lualine_config = utils.default_config


-- LEFT SECTION
-- utils.ins_left (config, utils.ins_delim)
utils.ins_left (lualine_config, utils.show_mode)
utils.ins_left (lualine_config, utils.show_git_branch)
utils.ins_left (lualine_config, utils.ins_section)
utils.ins_left (lualine_config, utils.show_filename)
utils.ins_left (lualine_config, utils.show_filesize)
-- utils.ins_left (config, utils.ins_section)


-- RIGHT SECTION
utils.ins_right (lualine_config, utils.show_lspserver)
utils.ins_right (lualine_config, utils.show_lspdiagnostics)
utils.ins_right (lualine_config, utils.show_encoding)
-- utils.ins_right (config, utils.show_fileformat)
utils.ins_right (lualine_config, utils.show_git_diff)
utils.ins_right (lualine_config, utils.show_progress)
utils.ins_right (lualine_config, utils.show_location)



-- BUFFERLINE CONFIGS
local bufferline_config = {
	options = {
		tab_size = 10,
		diagnostics = "nvim_lsp",
		custom_filter = function(buf_number)
			if vim.fn.bufname(buf_number) ~= "[No Name]" then
				return true
			end
		end,
		right_mouse_command = "vertical sbuffer %d",
	}
}


lualine.setup(lualine_config)
bufferline.setup(bufferline_config)
