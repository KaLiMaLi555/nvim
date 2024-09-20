return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        formatters_by_ft = {
            ["lua"] = { "stylua" },
            ["python"] = { "isort", "black" },
            ["typescriptreact"] = { "prettier" },
            ["typescript"] = { "prettier" },
            ["javascriptreact"] = { "prettier" },
            ["javascript"] = { "prettier" },
        },
        formatters = {
            black = {
                command = "black",
                args = {
                    "--stdin-filename",
                    "$FILENAME",
                    "--quiet",
                    "-",
                },
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
                local bufnr = vim.api.nvim_get_current_buf()
                local formatters_to_run = require("conform").list_formatters_to_run(bufnr)
                vim.notify("Formatting using " .. vim.inspect(formatters_to_run))
                require("conform").format()
            end,
            mode = { "n", "v" },
            desc = "Format Code using conform",
        },
    },
}
