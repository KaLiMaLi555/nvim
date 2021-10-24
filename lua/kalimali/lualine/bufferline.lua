if not pcall(require, "bufferline") then
	return
end

local g = vim.g
local fn = vim.fn
local cmd = vim.cmd

local function contains(table, val)
	-- P(table)
	for i=1,#table do
		if table[i] == val then
			return true
		end
	end
	return false
end

local remove_tabs = function()
	local filter = vim.tbl_filter
	local filter_func = function(b)
		if 1 ~= vim.fn.buflisted(b) then
			return false
		end
		if not string.find(vim.api.nvim_buf_get_name(b), vim.loop.cwd(), 1, true) then
			return false
		end
		return true
	end
	local WinBufManager = g.WinBufManager

	for i=1, #WinBufManager do
		WinBufManager[i] = filter(filter_func, WinBufManager[i])
	end
	g.WinBufManager = WinBufManager
end

StoreBufTab = function()
	remove_tabs()

	local WinBufManager = g.WinBufManager
	local tabnr = vim.api.nvim_tabpage_get_number('%')
	local bufnr = fn.bufnr('%')
	if bufnr == -1 then
		return
	end
	local buf_filetype = vim.api.nvim_buf_get_option(bufnr, 'filetype')
	if buf_filetype == "" then
		return
	end

	if not WinBufManager[tabnr] then
		WinBufManager[tabnr] = {}
	end

	for i, bufnrs in ipairs(WinBufManager) do
		for j, nr in ipairs(bufnrs) do
			if nr == bufnr and i~= tabnr then
				table.remove(WinBufManager[i], j)
			end
		end
	end

	-- P(WinBufManager)
	if not contains(WinBufManager[tabnr], bufnr) then
		table.insert(WinBufManager[tabnr], bufnr)
	end

	g.WinBufManager = WinBufManager
end

Delete_buf = function()
	local bufnr = fn.bufnr(0)
	P(bufnr)
	cmd(':BufferLineCyclePrev')
	cmd(':bd' .. bufnr)
	remove_tabs()
end

local filter_buf = function(bufnr)
	local tabnr = vim.api.nvim_tabpage_get_number('%')
	return contains(g.WinBufManager[tabnr], bufnr)
end

local bufferline = require 'bufferline'
-- BUFFERLINE CONFIGS
local bufferline_config = {
	options = {
		tab_size = 10,
		diagnostics = "nvim_lsp",
		custom_filter = function(bufnr)
			-- if vim.fn.bufname(bufnr) ~= "" and filter_buf(bufnr) then
			-- 	return true
			-- end
			if vim.fn.bufname(bufnr) ~= "" then
				return true
			end
		end,
		right_mouse_command = "vertical sbuffer %d",
	}
}
-- cmd[[
-- augroup Bufferline_group
-- autocmd!
-- autocmd BufEnter * :lua StoreBufTab()
-- augroup END
-- ]]
-- cmd[[
-- nnoremap <S-W> :lua Delete_buf()<CR>
-- ]]

bufferline.setup(bufferline_config)
