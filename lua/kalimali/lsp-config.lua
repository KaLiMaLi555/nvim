local USER_PATH = '/home/' .. vim.fn.expand('$USER')
local nvim_lsp = require('lspconfig')
local protocol = require('vim.lsp.protocol')
local servers = { "pylsp", "vimls", "bashls", "ccls", "tsserver" }
local saga = require('lspsaga')

vim.api.nvim_set_keymap(
	"i",
	"<C-x><C-m>",
	[[<c-r>=luaeval("require('complextras').complete_matching_line()")<CR>]],
	{ noremap = true }
)
vim.api.nvim_set_keymap(
	"i",
	"<C-x><C-d>",
	[[<c-r>=luaeval("require('complextras').complete_line_from_cwd()")<CR>]],
	{ noremap = true }
)

local lspkind = require('lspkind')
lspkind.init()

local cmp = require('cmp')
cmp.setup({
	mapping = {
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-e>"] = cmp.mapping.close(),
		["<c-y>"] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		},
		["<c-space>"] = cmp.mapping.complete(),
	},
	sources = {
		-- { name = "gh_issues" },

		{ name = "nvim_lua" },
		{ name = "zsh" },

		{ name = "nvim_lsp" },
		{ name = "path" },
		{ name = "luasnip" },
		{ name = "buffer", keyword_length = 5 },
	},
	formatting = {
		format = lspkind.cmp_format {
			with_text = true,
			menu = {
				buffer = "[buf]",
				nvim_lsp = "[LSP]",
				nvim_lua = "[api]",
				path = "[path]",
				-- luasnip = "[snip]",
				-- gh_issues = "[issues]",
			},
		},
	},

	experimental = {
		native_menu = false,

		ghost_text = true,
	},
})

saga.init_lsp_saga {
	error_sign = '',
	warn_sign = '',
	hint_sign = '',
	infor_sign = '',
	border_style = "round",
}

-- local on_attach = require('completion').on_attach
local on_attach = function(client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	--Enable completion triggered by <c-x><c-o>
	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	local opts = {
		noremap=true,
		silent=true
	}

	buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
	buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
	buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
	buf_set_keymap('n', '<space>D', '<cmd>vim.lsp.buf.type_definition<CR>', opts)
	buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
	buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
	buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

	-- if client.resolved_capabilities.document_formatting then
	--     vim.api.nvim_command [[augroup Format]]
	--     vim.api.nvim_command [[autocmd! * <buffer>]]
	--     vim.api.nvim_command [[autocmd  BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
	--     vim.api.nvim_command [[augroup END]]
	-- end

	-- require('completion').on_attach(client, bufnr)

	protocol.CompletionItemKind = {
		'', -- Text
		'', -- Method
		'', -- Function
		'', -- Constructor
		'', -- Field
		'', -- Variable
		'', -- Class
		'ﰮ', -- Interface
		'', -- Module
		'', -- Property
		'', -- Unit
		'', -- Value
		'', -- Enum
		'', -- Keyword
		'﬌', -- Snippet
		'', -- Color
		'', -- File
		'', -- Reference
		'', -- Folder
		'', -- EnumMember
		'', -- Constant
		'', -- Struct
		'', -- Event
		'ﬦ', -- Operator
		'', -- TypeParameter
	}
	client.resolved_capabilities.document_formatting = false
	client.resolved_capabilities.document_range_formatting = false

end


local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = {
		'documentation',
		'detail',
		'additionalTextEdits',
	}
}

for _, server in ipairs(servers) do
	nvim_lsp[server].setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}
end

local sumneko_root_path = USER_PATH .. '/.config/nvim/plugged/lua-language-server'
local sumneko_binary = sumneko_root_path .. "/bin/Linux/lua-language-server"
require('lspconfig').sumneko_lua.setup {
	on_attach = on_attach,
	cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
				path = vim.split(package.path, ';'),
			},
			diagnostics = {
				globals = {'vim'},
			},
			workspace = {
				library = {
					[vim.fn.expand('$VIMRUNTIME/lua')] = true,
					[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
				},
			},
		},
	},
	capabilities = capabilities,
}

local opts = {
    highlight_hovered_item = true,
    show_guides = true,
}
-- require('symbols-outline').setup(opts)
