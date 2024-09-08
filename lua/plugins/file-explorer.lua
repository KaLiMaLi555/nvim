return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        keys = {
            {
                "<leader>e",
                function()
                    vim.cmd(
                        "silent! Neotree position=float toggle=true dir=%:p:h reveal_file=%:p <CR>"
                    )
                end,
                desc = "Open NeoTree File Explorer",
            },
            { "<leader>E", false },
        },
        config = function()
            vim.notify("NeoTree Loaded", vim.log.levels.INFO, { title = "NeoTree" })
            require("neo-tree").setup({
                filesystem = {
                    follow_current_file = {
                        enabled = true,
                    },
                    window = {
                        position = "float",
                    },
                    hijack_netrw_behavior = "disabled",
                },
            })
        end,
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
                    ["s"] = {
                        "actions.select",
                        opts = { vertical = true },
                        desc = "Open the entry in a vertical split",
                    },
                    ["h"] = {
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
