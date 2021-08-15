require('kalimali.globals')
require("kalimali.telescope")
require("kalimali.lsp-config")
-- require("kalimali.compe-config")
require('nvim-treesitter.configs').setup {
    highlight = {
        enable = true,
        disable = {},
    },
    indent = {
        enable = true,
        disable = {},
    },
    ensure_installed = {
        "bash",
        "c",
        "cmake",
        "cpp",
        "cuda",
        "lua",
        "html",
        "python"
    }
}
