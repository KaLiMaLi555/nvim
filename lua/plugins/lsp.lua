local ensure_installed = {
    lang_servers = {
        "lua_ls",
        "pylsp",
        "ts_ls",
    },
    lang_tools = {
        "prettier",
        "stylua",
        "isort",
        "black",
        "mypy",
        "pylint",
        "eslint",
    },
}

return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",

        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
        "lukas-reineke/cmp-under-comparator",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        {
            "L3MON4D3/LuaSnip",
            version = "v2.3.0",
        },
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
    },

    config = function()
        local cmp = require("cmp")
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )
        capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false

        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = ensure_installed.lang_servers,
            automatic_installation = true,
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup({
                        on_attach = require("lazyvim.plugins.lsp.keymaps").on_attach,
                        capabilities = capabilities,
                    })
                end,
                ["pylsp"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.pylsp.setup({
                        on_attach = require("lazyvim.plugins.lsp.keymaps").on_attach,
                        capabilities = capabilities,
                        flags = {
                            debounce_text_changes = 200,
                        },
                        settings = {
                            pylsp = {
                                plugins = {
                                    mccabe = {
                                        enabled = false,
                                    },
                                    pycodestyle = {
                                        enabled = false,
                                    },
                                    rope_autoimport = {
                                        enabled = true,
                                    },
                                },
                            },
                        },
                    })
                end,
                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup({
                        on_attach = require("lazyvim.plugins.lsp.keymaps").on_attach,
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                runtime = { version = "Lua 5.4.6" },
                                diagnostics = {
                                    globals = { "vim" },
                                },
                            },
                        },
                    })
                end,
            },
        })
        require("mason-tool-installer").setup({
            ensure_installed = ensure_installed.lang_tools,
        })

        local cmp_select = { behavior = cmp.SelectBehavior.Select }
        cmp.setup({
            window = {
                completion = cmp.config.window.bordered({
                    border = "single",
                    winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
                }),
                documentation = cmp.config.window.bordered({
                    documentation = {
                        border = {
                            "╭",
                            "─",
                            "╮",
                            "│",
                            "╯",
                            "─",
                            "╰",
                            "│",
                        },
                    },
                }),
            },
            completion = {
                completeopt = "menu,menuone,preview,noinsert",
            },
            expand = function(args)
                require("luasnip").lsp_expand(args.body)
            end,
            mapping = cmp.mapping.preset.insert({
                ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = "luasnip" },
                { name = "nvim_lsp" },
                { name = "buffer" },
                { name = "path" },
            }),
            sorting = {
                comparators = {
                    cmp.config.compare.offset,
                    cmp.config.compare.exact,
                    cmp.config.compare.score,
                    require("cmp-under-comparator").under,
                    cmp.config.compare.kind,
                    cmp.config.compare.sort_text,
                    cmp.config.compare.length,
                    cmp.config.compare.order,
                },
                priority_weight = 1,
            },
        })
        vim.diagnostic.config({
            update_in_insert = false,
            severity_sort = true,
        })
    end,
}
