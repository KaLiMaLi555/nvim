local M = {}

M.update_table = function(dst, src)
	for option, value in pairs(src) do
		dst[option] = value
	end
end

return M

