require("mason").setup()
require("mason-lspconfig").setup({})

require('mason.settings').set({
	ui = {
		border = 'rounded'
	}
})

local on_attach = function(client, bufnr)
	client.resolved_capabilities = require('cmp_nvim_lsp').default_capabilities()
end

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
		['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
		['<Tab>'] = cmp.mapping.confirm({ select = true }),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
	}),
	sources = cmp.config.sources(
		{
			{ name = 'nvim_lsp' },
		},
		{
			{ name = 'buffer' },
		},
		{
			{ name = 'luasnip' },
		}
	)
})

require 'navigator'.setup({
	debug = true,
	mason = true,
	on_attach = on_attach,
	lsp = {
		format_on_save = false,
	}
})
