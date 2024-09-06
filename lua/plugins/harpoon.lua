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
                "<localleader>a",
                function()
                    local harpoon = require("harpoon")
                    harpoon:list():select(1)
                end,
                desc = "Jump to harpoon file [1]",
            },
            {
                "<localleader>s",
                function()
                    local harpoon = require("harpoon")
                    harpoon:list():select(2)
                end,
                desc = "Jump to harpoon file [2]",
            },
            {
                "<localleader>d",
                function()
                    local harpoon = require("harpoon")
                    harpoon:list():select(3)
                end,
                desc = "Jump to harpoon file [3]",
            },
            {
                "<localleader>f",
                function()
                    local harpoon = require("harpoon")
                    harpoon:list():select(4)
                end,
                desc = "Jump to harpoon file [4]",
            },
        },
    },
}
