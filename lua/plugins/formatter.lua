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
        keys = {
            {
                "<leader>cf",
                function()
                    require("conform").format({
                        formatters = { "injected" },
                        timeout_ms = 3000,
                    })
                end,
                mode = { "n", "v" },
                desc = "Format Code using conform",
            },
        },
    },
}
