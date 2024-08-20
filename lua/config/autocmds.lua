-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when copying test",
    group = vim.api.nvim_create_augroup("Highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})
