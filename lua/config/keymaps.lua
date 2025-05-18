-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = function(mode, key, action, opts)
	local opts = opts or {}
	vim.keymap.set(mode, key, action, opts)
end

map("n", "<Esc>", "<CMD>nohlsearch<CR>", {})
map("i", "jk", "<ESC>", {})
map("t", "<Esc><Esc>", "<C-\\><C-n><CMD>q<CR>", {})
map("n", "<C-s>", ":w<CR>", {})
map("n", "dw", "vbd", {})
map("n", "ZZ", "<CMD>qa<CR>", {})
map("v", "J", ":m '>+1<CR>gv=gv", {})
map("v", "K", ":m '<-2<CR>gv=gv", {})
map("n", "J", "mzJ`z", {})
map("n", "<C-d>", "<C-d>zz", {})
map("n", "<C-u>", "<C-u>zz", {})
map("n", "n", "nzzzv", {})
map("n", "N", "Nzzzv", {})
map("n", "<leader>Y", [["+Y]], {})
map("n", "<leader>d", [["_d]], {})
map("n", "W", "<CMD>q<CR>", {})
map("n", "<localleader>w", "<CMD>bd<CR>", {})
map("n", "<localleader>j", "<CMD>cnext<CR>zz", {})
map("n", "<localleader>k", "<CMD>cprev<CR>zz", {})
map("n", "<leader>S", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {})

-- require("config.discipline").run({max_keypress_allowed = 10})
