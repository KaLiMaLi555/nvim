P = function(v)
	print(vim.inspect(v))
    return v
end

if pcall(require, "plenary") then
    RELOAD = require("plenary.reload").reload_module

    R = function(name)
        RELOAD(name)
        return require(name)
    end
end

require('Comment').setup()

require('neoscroll').setup({
	mappings = {'<C-k>', '<C-j>', nil, nil,
		'<A-k>', '<A-j>', 'zt', 'zz', 'zb'},
})
local t = {}
t['<C-k>'] = {'scroll', {'-vim.wo.scroll', 'true', '250'}}
t['<C-j>'] = {'scroll', { 'vim.wo.scroll', 'true', '250'}}
t['<A-k>'] = {'scroll', {'-0.10', 'false', '100'}}
t['<A-j>'] = {'scroll', { '0.10', 'false', '100'}}

require('neoscroll.config').set_mappings(t)
