return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local lint = require("lint")
        local linters = require("lint").linters

        lint.linters_by_ft = {
            ["python"] = { "mypy", "pylint" },
            ["typescript"] = { "eslint" },
        }

        linters.mypy.args = {
            "--show-column-numbers",
            "--check-untyped-defs",
            "--show-error-end",
            "--hide-error-codes",
            "--hide-error-context",
            "--no-color-output",
            "--no-error-summary",
            "--no-pretty",
            "--python-executable",
            function()
                return vim.fn.exepath("python3") or vim.fn.exepath("python")
            end,
        }

        local lint_group = vim.api.nvim_create_augroup("Linter", { clear = true })
        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            group = lint_group,
            callback = function()
                require("lint").try_lint()
            end,
        })

        require("lint").try_lint()
    end,
}
