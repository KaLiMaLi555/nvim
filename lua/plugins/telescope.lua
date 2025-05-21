return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
		},
		"nvim-telescope/telescope-file-browser.nvim",
	},
	keys = {
        {
            "<C-b>",
            function()
                local telescope = require("telescope")

                telescope.extensions.file_browser.file_browser({
                    path = "%:p:h",
                    cwd = vim.fn.expand("%:p:h"),
                    respect_gitignore = false,
                    hidden = true,
                    grouped = true,
                    previewer = false,
                    initial_mode = "insert",
                    layout_config = { height = 40, width = 100 }
                })
            end
        },
		{
			"<C-p>",
			"<CMD>Telescope git_files<CR>",
		},
		{
			"<localleader>p",
			"<CMD>Telescope find_files<CR>",
		},
		{
			"<localleader>fw",
			function ()
				local builtin = require('telescope.builtin')
				local word = vim.fn.expand("<cword>")
				builtin.grep_string({ search = word })
			end
		},
		{
			"<localleader>fW",
			function ()
				local builtin = require('telescope.builtin')
				local word = vim.fn.expand("<cWORD>")
				builtin.grep_string({ search = word })
			end
		},
		{
			"<localleader>gs",
			function ()
				local builtin = require('telescope.builtin')
				local word = vim.fn.input("Grep > ")
				builtin.grep_string({ search = word })
			end
		},
		{
			"<localleader>vh",
			function ()
				local builtin = require('telescope.builtin')
				builtin.help_tags()
			end,
		},
    },
	config = function(_, opts)
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local fb_actions = require("telescope").extensions.file_browser.actions

        opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
            wrap_results = true,
            layout_strategy = "horizontal",
            prompt_postion = "top",
            sorting_strategy = "ascending",
            winblend = 0,
            mappings = {
                n = {}
            }
        })
        opts.pickers = {
            diagnostics = {
                theme = "ivy",
                initial_mode = "normal",
                layout_config = {
                    preview_cutoff = 9999
                }
            }
        }
        opts.extensions = {
            file_browser = {
                theme = "dropdown",
                initial_mode = "normal",
                hijack_netrw = true,
                mappings = {
                    ["n"] = {
                        ["N"] = fb_actions.create,
                        ["h"] = fb_actions.goto_parent_dir,
                        ["dd"] = fb_actions.remove,
                        ["yy"] = fb_actions.copy,
                        ["m"] = fb_actions.move,
                        ["/"] = function()
                            vim.cmd("startinsert")
                        end,
                        ["<C-n>"] = function(prompt_bufnr)
                            for _ = 1, 10 do
                                actions.move_selection_next(prompt_bufnr)
                            end
                        end,
                        ["<C-p>"] = function(prompt_bufnr)
                            for _ = 1, 10 do
                                actions.move_selection_previous(prompt_bufnr)
                            end
                        end,
                        ["<C-u>"] = actions.results_scrolling_up,
                        ["<C-d>"] = actions.results_scrolling_down
                    }
                }
            },
            extensions = {
                fzf = {
                    fuzzy = true,                   -- false will only do exact matching
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true,    -- override the file sorter
                    case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
                    -- the default case_mode is "smart_case"
                },
            },
        }
        telescope.setup(opts)
        require("telescope").load_extension("fzf")
        require("telescope").load_extension("file_browser")
    end,
}

