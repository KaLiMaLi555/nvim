return {
    {
        "jose-elias-alvarez/null-ls.nvim",
        ft = { "python", "lua" },
        opts = function()
            return require("config.null-ls")
        end,
    },
}
