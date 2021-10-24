local M = {}

M.get_conda_command = function()
	local conda_env_name = vim.g.conda_active_env
	if conda_env_name == "base" then
		-- P("No conda env selected")
		return ""
	else
		local conda_cmd = "conda activate " .. conda_env_name .. ""
		-- P(conda_cmd)
		return conda_cmd
	end
end

return M
