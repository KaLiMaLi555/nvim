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
                    vim.cmd("silent! Neotree position=float toggle=true dir=%:p:h reveal_file=%:p <CR>")
                end,
                desc = "Open NeoTree File Explorer",
            },
            { "<leader>E", false },
        },
    },
    {
        "stevearc/oil.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
        config = function()
            require("oil").setup()
        end,
        keys = {
            { "<leader>E", "<Cmd>Oil --float<CR>", desc = "Open Oil File Explorer" },
        },
    },
}
