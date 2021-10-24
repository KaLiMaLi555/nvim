if not pcall(require, "lualine") then
	return
end

local should_reload = true
local reloader = function()
	if should_reload then
		RELOAD "lualine"
		RELOAD "bufferline"
		RELOAD "kalimali.lualine.utils"
		RELOAD "kalimali.lualine.bufferline"
	end
end
reloader()

local lualine = require 'lualine'
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



lualine.setup(lualine_config)
require "kalimali.lualine.bufferline"
