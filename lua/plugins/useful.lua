return {
    {
        "tpope/vim-repeat",
        event = { "BufReadPre", "BufNewFile" },
    },
    {
        "numToStr/Comment.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = true,
    },
    {
        "kylechui/nvim-surround",
        event = { "BufReadPre", "BufNewFile" },
        config = true,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPre", "BufNewFile" },
        main = "ibl",
        opts = {
            indent = { char = "┃" },
        },
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
    },
}
