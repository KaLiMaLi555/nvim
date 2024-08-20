local null_ls = require("null-ls")

local format_code = function()
    vim.lsp.buf.format()
    vim.cmd("write")
end

local opts = {
    sources = {
        null_ls.builtins.formatting.black,
        null_ls.builtins.diagnostics.mypy,
        null_ls.builtins.diagnostics.ruff,
        null_ls.builtins.formatting.stylua,
    },
    on_attach = function(client, _)
        if client.supports_method("textDocument/formatting") then
            vim.keymap.set(
                "n",
                "<leader>cf",
                format_code,
                { desc = "Format code using null_ls" }
            )
        end
    end,
}

return opts
