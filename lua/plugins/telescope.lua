return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    keys = {
        { "<C-p>", require("telescope.builtin").git_files, { desc = "Git Files" } },
        {
            "<leader>pw",
            function()
                local word = vim.fn.expand("<cword>")
                require("telescope.builtin").grep_string({ search = word })
            end,
            { desc = "Telescope search current word" },
        },
        {
            "<leader>pW",
            function()
                local word = vim.fn.expand("<cWORD>")
                require("telescope.builtin").grep_string({ search = word })
            end,
            { desc = "Telescope search current WORD" },
        },
        {
            "<leader>ps",
            function()
                require("telescope.builtin").grep_string({
                    search = vim.fn.input("Grep > "),
                })
            end,
            {desc = "Telescope search word"}
        },
        {
            "<leader>P",
            require("telescope").extensions.projects.projects,
            { desc = "Search Projects" },
        },
    },

    config = function()
        require("telescope").setup({})
        require("telescope").load_extension("projects")
    end,
}
