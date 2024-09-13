return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        formatters_by_ft = {
            ["lua"] = { "stylua" },
            ["python"] = { "isort", "black" },
        },
        formatters = {
            black = {
                command = "black --line-length 79",
            },
        },
        timeout_ms = 500,
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
                require("conform").format()
            end,
            mode = { "n", "v" },
            desc = "Format Code using conform",
        },
    },
}
