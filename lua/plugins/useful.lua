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
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
    },
    {
        "akinsho/bufferline.nvim",
        enabled = false
    },
    {
        "folke/flash.nvim",
        enabled = false
    }
}
