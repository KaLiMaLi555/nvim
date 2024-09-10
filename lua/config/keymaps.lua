-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap

keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "No hightlight search" })
keymap.set("i", "jk", "<Esc>", { desc = "which_key_ignore" })
keymap.set("t", "<Esc><Esc>", "<C-\\><C-n><cmd>q<CR>", { desc = "which_key_ignore" })

keymap.set("n", "ZZ", "<cmd>qa<CR>", { desc = "Exit nvim" })

keymap.set("v", "J", ":m '>+1<CR>gv=gv", {desc = "which_key_ignore"})
keymap.set("v", "K", ":m '<-2<CR>gv=gv",{desc = "which_key_ignore"})

keymap.set("n", "J", "mzJ`z", {desc = "which_key_ignore"})
keymap.set("n", "<C-d>", "<C-d>zz", {desc = "which_key_ignore"})
keymap.set("n", "<C-u>", "<C-u>zz", {desc = "which_key_ignore"})
keymap.set("n", "n", "nzzzv", {desc = "which_key_ignore"})
keymap.set("n", "N", "Nzzzv", {desc = "which_key_ignore"})

keymap.set("n", "<leader>Y", [["+Y]], {desc = "which_key_ignore"})

keymap.set({"n", "v"}, "<leader>d", [["_d]], {desc = "which_key_ignore"})

keymap.set("n", "W", "<cmd>q<CR>", {desc = "which_key_ignore"})
keymap.set("n", "<localleader>w", "<cmd>bd<CR>", {desc = "which_key_ignore"})
keymap.set("n", "<localleader>j", "<cmd>cnext<CR>zz", {desc = "which_key_ignore"})
keymap.set("n", "<localleader>k", "<cmd>cprev<CR>zz", {desc = "which_key_ignore"})

keymap.set("n", "<leader>S", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {desc = "which_key_ignore"})
