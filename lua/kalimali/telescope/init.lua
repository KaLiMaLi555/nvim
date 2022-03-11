if not pcall(require, "telescope") then
	return
end

local should_reload = true
local reloader = function()
	if should_reload then
		RELOAD "plenary"
		RELOAD "popup"
		RELOAD "telescope"
		RELOAD "kalimali.telescope.utils"
	end
end
reloader()

local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local themes = require "telescope.themes"
local utils = require "kalimali.telescope.utils"

require('telescope').setup
{
	defaults =
		{
			file_sorter = require('telescope.sorters').get_fzy_sorter,
			layout_config =
				{
					prompt_position = "bottom",
				},
			prompt_prefix = ' ~ ',
			selection_caret = ' => ',
			color_devicons = true,
			borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },

			file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
			grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
			qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

			mappings =
				{
					i = {
						["<C-x>"] = false,
						["<C-q>"] = actions.send_to_qflist,
					},
					n = {
						["q"] = actions.close
					}
				},

			file_ignore_patterns = { "node_modules",
									 ".eggs",
								     ".ccls-cache" }
		},
	extensions =
		{
			fzy_native =
				{
					override_generic_sorter = false,
					override_file_sorter = true,
				},
			file_browser =
				{
					-- theme = "ivy",
					mappings =
						{
							["i"] = {},
							["n"] = {},
					},
				},
		}
}

require('telescope').load_extension('fzy_native')
require("telescope").load_extension('file_browser')

local M = {}
M.search_dotfiles = function()
	require("telescope.builtin").find_files(
		{
			prompt_title = " DotFiles ",
			cwd = "$HOME/.config/nvim/"
		}
	)
end

M.git_branches = function()
	require("telescope.builtin").git_branches(
		{
			attach_mappings = function(_, map)
				map('i', '<c-d>', actions.git_delete_branch)
				map('n', '<c-d>', actions.git_delete_branch)
				return true
			end
		}
	)
end

M.search_envs = function()
	local conda_path = vim.fn.expand('$HOME')
	local envs_path = conda_path .. '/anaconda3/envs/'
	local opts = themes.get_dropdown{
		prompt_title = " Conda Environments ",
		winblend = 5,
		previewer = false,
		shorten_path = false,

		cwd = envs_path,

		layout_config =
			{
				width = 0.3
			},

		attach_mappings = function(prompt_bufnr, map)
			local current_picker = action_state.get_current_picker(prompt_bufnr)
			map(
				"i",
				"<CR>",
				function()
					local entry = action_state.get_selected_entry()
					vim.g.python3_host_prog = envs_path .. entry.value .. '/bin/python3'
					vim.g.conda_active_env = entry.value
					actions.close(prompt_bufnr)
				end
			)

			return true
		end
	}
	utils.find_dirs(opts)
end

function M.git_status()
	local opts = themes.get_dropdown {
		winblend = 10,
		border = true,
		previewer = false,
		shorten_path = false,
	}

	-- Can change the git icons using this.
	opts.git_icons = {
		changed = "+",
		deleted = "-",
	}

	require("telescope.builtin").git_status(opts)
end

return setmetatable(
	{},
	{
		__index = function(_, k)
			reloader()
			if M[k] then
				return M[k]
			else
				return require("telescope.builtin")[k]
			end
		end,
	}
)
