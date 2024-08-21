return {
    { "tpope/vim-repeat" },
    {
        "numToStr/Comment.nvim",
        config = function ()
            require("Comment").setup()
        end
    }
}
