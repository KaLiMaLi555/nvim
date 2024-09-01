return {
    "shortcuts/no-neck-pain.nvim",
    version = "*",
    config = function()
        require("no-neck-pain").setup({
            buffers = {
                scratchPad = {
                    enabled = true,
                    location = "~/Documents/",
                },
                bo = {
                    filetype = "md",
                },
                background = "tokyonight-night",
            },
        })
    end,
    keys = {
        {
            "<leader>np",
            function ()
                vim.cmd("NoNeckPain")
            end,
            desc = "Center Buffer",
        },
        {
            "<leader>nr",
            function ()
                vim.cmd("NoNeckPainResize 130")
            end,
            desc = "Resize Centered Buffer",
        },

    },
}
