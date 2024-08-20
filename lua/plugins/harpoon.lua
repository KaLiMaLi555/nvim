return {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        init = function()
            local harpoon = require("harpoon")
            harpoon:setup()
        end,
        keys = {
            {
                "<leader>a",
                function()
                    local harpoon = require("harpoon")
                    harpoon:list():add()
                end,
                desc = "Add file to harpoon list",
            },
            {
                "<C-e>",
                function()
                    local harpoon = require("harpoon")
                    harpoon.ui:toggle_quick_menu(harpoon:list())
                end,
                desc = "Show harpoon file list",
            },
            {
                "<leader>ha",
                function()
                    local harpoon = require("harpoon")
                    harpoon:list():select(1)
                end,
            },
            {
                "<leader>hs",
                function()
                    local harpoon = require("harpoon")
                    harpoon:list():select(2)
                end,
            },
            {
                "<leader>hd",
                function()
                    local harpoon = require("harpoon")
                    harpoon:list():select(3)
                end,
            },
            {
                "<leader>hf",
                function()
                    local harpoon = require("harpoon")
                    harpoon:list():select(4)
                end,
            },
        },
    },
}
