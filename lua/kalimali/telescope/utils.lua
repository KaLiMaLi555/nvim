local finders = require "telescope.finders"
local conf = require("telescope.config").values
local pickers = require "telescope.pickers"

M = {}
M.find_dirs = function(opts)
	local find_command = {'ls', opts.cwd}
	-- P(opts.cwd)
	pickers.new(
		opts,
		{
			finder = finders.new_oneshot_job(find_command, opts),
			previewer = conf.file_previewer(opts),
			sorter = conf.file_sorter(opts),
		}
	):find()
end

return M
