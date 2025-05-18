vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when copying test",
    group = vim.api.nvim_create_augroup("Highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})
