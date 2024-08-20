-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "No hightlight seach" })
vim.keymap.set("i", "jj", "<Esc>", { desc = "Smooth escape" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n><cmd>q<CR>", { desc = "Exit terminal mode" })
