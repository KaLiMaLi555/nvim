return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        enabled = false
    },
    {
        "stevearc/oil.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
        config = function()
            require("oil").setup({
                skip_confirm_for_simple_edits = true,
                keymaps = {
                    ["/"] = "actions.toggle_hidden",
                    ["<C-s>"] = false,
                    ["h"] = "actions.parent",
                    ["|"] = {
                        "actions.select",
                        opts = { vertical = true },
                        desc = "Open the entry in a vertical split",
                    },
                    ["-"] = {
                        "actions.select",
                        opts = { horizontal = true },
                        desc = "Open the entry in a horizontal split",
                    },
                    ["t"] = {
                        "actions.select",
                        opts = { tab = true },
                        desc = "Open the entry in new tab",
                    },
                    ["q"] = "actions.close",
                },
            })
        end,
        keys = {
            { "<leader>E", "<Cmd>Oil --float<CR>", desc = "Open Oil File Explorer" },
        },
    },
}
