return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        formatters_by_ft = {
            ["lua"] = { "stylua" },
            ["python"] = { "isort", "black" },
        },
    },
    keys = {
        {
            "<leader>cF",
            false,
        },
        {
            "<leader>cf",
            function()
                vim.notify("Formatting code with conform")
                require("conform").format({
                    formatters = nil,
                    timeout_ms = 500,
                })
            end,
            mode = { "n", "v" },
            desc = "Format Code using conform",
        },
    },
}
