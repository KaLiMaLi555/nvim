return {
    {
        "supermaven-inc/supermaven-nvim",
        config = function()
            require("supermaven-nvim").setup({
                keymaps = {
                    accept_suggestion = "<C-c>",
                    clear_suggestion = "<Esc>",
                    accept_word = "<C-space>",
                },
            })
        end,
    },
    -- {
    --
    --     "Exafunction/codeium.vim",
    --     config = function()
    --         vim.keymap.set("i", "<C-c>", function()
    --             return vim.fn["codeium#Accept"]()
    --         end, { expr = true, silent = true })
    --
    --         vim.keymap.set("i", "<C-k>", function()
    --             return vim.fn["codeium#CycleCompletions"](-1)
    --         end, { expr = true, silent = true })
    --
    --         vim.keymap.set("i", "<C-j>", function()
    --             return vim.fn["codeium#CycleCompletions"](1)
    --         end, { expr = true, silent = true })
    --
    --         vim.keymap.set("i", "<C-x>", function()
    --             return vim.fn["codeium#Clear"]()
    --         end, { expr = true, silent = true })
    --
    --         vim.keymap.set("i", "<C-space>", function()
    --             return vim.fn["codeium#Complete"]()
    --         end, { expr = true, silent = true })
    --     end,
    -- },
}
