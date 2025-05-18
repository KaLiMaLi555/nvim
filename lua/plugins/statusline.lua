return {
    "b0o/incline.nvim",
    event = "BufReadPre",
    dependencies = { "nvim-tree/nvim-web-devicons", "folke/tokyonight.nvim" },
    priority = 1200,
    config = function()
        local colors = require("tokyonight.colors").setup()
        require("incline").setup({
            highlight = {
                groups = {
                    InclineNormal = { guibg = colors.bg_highlight },
                    InclineNormalNC = { guibg = colors.bg_highlight },
                }
            },
            window = {
                margin = {
                    vertical = 0,
                    horizontal = 1
                }
            },
            hide = {
                cursorline = false,
            },
            render = function(props)
                local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
                if vim.bo[props.buf].modified then
                    filename = "[+]" .. filename
                end

                local icon, color = require("nvim-web-devicons").get_icon_color(filename)
                return { { icon, guifg = color }, { " " }, { filename } }
            end,
        })
    end,
}
