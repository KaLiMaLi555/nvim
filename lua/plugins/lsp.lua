return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"mason-org/mason.nvim",
			"lukas-reineke/cmp-under-comparator",
			"j-hui/fidget.nvim",
			"onsails/lspkind-nvim",
			"glepnir/lspsaga.nvim",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			local lspkind = require("lspkind")
			local lspsaga = require("lspsaga")
			require("mason").setup()
			require("fidget").setup({})

			lspsaga.setup({
				ui = {
					border = "rounded",
					devicon = true,
					foldericon = true,
					title = true,
					expand = "⊞",
					collapse = "⊟",
					code_action = "💡",
					actionfix = " ",
					lines = { "┗", "┣", "┃", "━", "┏" },
					kind = nil,
					imp_sign = "󰳛 ",
				},
				code_action = {
					num_showcut = true,
					show_server_name = false,
					keys = {
						quit = "q",
						exec = "<CR>",
					},
				},
				lightbulb = {
					enable = true,
					enable_in_insert = true,
					sign = true,
					sign_priority = 40,
					virtual_text = true,
				},
				rename = {
					quit = "<C-c>",
					exec = "<CR>",
					mark = "x",
					confirm = "<CR>",
					in_select = true,
				},
				symbol_in_winbar = {
					enable = true,
					separator = "/",
					ignore_patterns = {},
					hide_keyword = true,
					show_file = true,
					folder_level = 2,
					respect_root = false,
					color_mode = true,
				},
				implement = {
					enable = true,
					sign = true,
					virtual_text = true,
					priority = 100,
				},
			})
			lspkind.init({
				mode = "symbol_text",
				preset = "codicons",
				symbol_map = {
					Text = "󰉿",
					Method = "󰆧",
					Function = "󰊕",
					Constructor = "",
					Field = "󰜢",
					Variable = "󰀫",
					Class = "󰠱",
					Interface = "",
					Module = "",
					Property = "󰜢",
					Unit = "󰑭",
					Value = "󰎠",
					Enum = "",
					Keyword = "󰌋",
					Snippet = "",
					Color = "󰏘",
					File = "󰈙",
					Reference = "󰈇",
					Folder = "󰉋",
					EnumMember = "",
					Constant = "󰏿",
					Struct = "󰙅",
					Event = "",
					Operator = "󰆕",
					TypeParameter = ""
				},
			})

			local opts = { noremap = true, silent = true }
			vim.keymap.set('n', '<localleader>j', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
			vim.keymap.set('n', '<localleader>k', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
			vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
			vim.keymap.set('n', 'gp', '<Cmd>Lspsaga preview_definition<CR>', opts)
			vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)

			local servers = { "pyright", "ts_ls", "lua_ls" }
			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
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
				formatting = {
					completion = { border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, scrollbar = "║" },
					documentation = {
						border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
						scrollbar = "║",
					},
					format = lspkind.cmp_format({
						mode = "symbol",
						maxwidth = 20,
						ellipsis_char = "...",
					}),
				},
				mapping = {
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-y>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-c>"] = cmp.mapping.close(),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, {
						"i",
						"s",
					}),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, {
						"i",
						"s",
					}),
				},
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}, {
					{ name = "buffer" },
					{ name = "path" },
					{ name = "cmdline" },
				},
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
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			for _, server in pairs(servers) do
				require("lspconfig")[server].setup({
					capabilities = capabilities,
				})
			end
			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				update_in_insert = true,
			})
			local signs = { Error = "󰅙", Info = "󰋼", Hint = "󰌵", Warn = "" }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end
		end
	}
}
