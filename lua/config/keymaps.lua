-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local g = vim.g

keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "No hightlight search" })
keymap.set("i", "jk", "<Esc>", { desc = "Smooth escape" })
keymap.set("t", "<Esc><Esc>", "<C-\\><C-n><cmd>q<CR>", { desc = "Exit terminal mode" })

keymap.set("n", "ZZ", "<cmd>qa<CR>", { desc = "Exit nvim" })

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", "J", "mzJ`z")
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

keymap.set("n", "<leader>Y", [["+Y]])

keymap.set({"n", "v"}, "<leader>d", [["_d]])

keymap.set("n", "W", "<cmd>q<CR>")
keymap.set("n", "<leader>j", "<cmd>cnext<CR>zz")
keymap.set("n", "<leader>k", "<cmd>cprev<CR>zz")

keymap.set("n", "<leader>S", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
