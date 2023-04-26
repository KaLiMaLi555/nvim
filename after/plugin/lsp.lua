require('mason.settings').set({
    ui = {
        border = 'rounded'
    }
})

local lsp = require('lsp-zero')
local cmp = require('cmp')

lsp.preset('recommended')

lsp.ensure_installed({
	'pylsp',
    'lua_ls'
})

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
	['<CR>'] = cmp.mapping.confirm({ select = true }),
	['<Tab>'] = cmp.mapping.confirm({ select = true }),
	['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
})

local on_attach = function(_, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
	vim.keymap.set('n', '<leader>vws', vim.lsp.buf.workspace_symbol, opts)
	vim.keymap.set('n', '<leader>vd', vim.lsp.diagnostic.open_float, opts)
	vim.keymap.set('n', '[d', vim.lsp.diagnostic.goto_prev, opts)
	vim.keymap.set('n', ']d', vim.lsp.diagnostic.goto_next, opts)
	vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, opts)
	vim.keymap.set('n', '<leader>rrr', vim.lsp.buf.references, opts)
	vim.keymap.set('n', '<leader>vrn', vim.lsp.buf.rename, opts)
	vim.keymap.set('n', '<C-h>', vim.lsp.buf.signature_help, opts)
end


lsp.setup({on_attach = on_attach})
cmp.setup({
	mapping = cmp.mapping.preset.insert(cmp_mappings),
})

vim.diagnostic.config({
	virtual_text = true
})
