local USER_PATH = '/home/' .. vim.fn.expand('$USER')

local sumneko_root_path = USER_PATH .. '/.config/nvim/plugged/lua-language-server'
local sumneko_binary = sumneko_root_path .. "/bin/Linux/lua-language-server"

ON_ATTACH = require('completion').on_attach


require('lspconfig').pyright.setup{ on_attach=ON_ATTACH }
require('lspconfig').bashls.setup{ on_attach=ON_ATTACH }
require('lspconfig').ccls.setup{ on_attach=ON_ATTACH }
require('lspconfig').tsserver.setup{ on_attach=ON_ATTACH }


require('lspconfig').sumneko_lua.setup {
    on_attach = ON_ATTACH,
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
}
