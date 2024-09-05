return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
        },
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
            "<leader>pr",
            require("telescope").extensions.projects.projects,
            { desc = "Search Projects" },
        },
        {
            "<leader>ps",
            function()
                require("telescope.builtin").grep_string({
                    search = vim.fn.input("Grep > "),
                })
            end,
            { desc = "Search any word" },
        },
    },

    config = function()
        require("telescope").setup({
            extensions = {
                fzf = {
                    fuzzy = true, -- false will only do exact matching
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true, -- override the file sorter
                    case_mode = "smart_case", -- or "ignore_case" or "respect_case"
                    -- the default case_mode is "smart_case"
                },
            },
        })
        require("telescope").load_extension("projects")
        require("telescope").load_extension("fzf")
    end,
}
