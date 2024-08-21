return {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "nvim-telescope/telescope.nvim",
        "mfussenegger/nvim-dap-python",
    },
    branch = "regexp",
    config = function()
        require("venv-selector").setup({
            settings = {
                search = {
                    my_venvs = {
                        command = "fdfind python$ ~/.envs",
                    },
                },
            },
        })
    end,
    event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
    keys = {
        -- Keymap to open VenvSelector to pick a venv.
        { "<leader>vs", "<cmd>VenvSelect<CR>" },
        -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
        { "<leader>vc", "<cmd>VenvSelectCached<CR>" },
    },
}
