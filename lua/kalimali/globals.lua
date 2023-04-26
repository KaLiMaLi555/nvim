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

CLOSE_ALL = function()
    local nvterm = require('nvterm.terminal')
    local terms = nvterm.list_terms()
    for _, term in ipairs(terms) do
        vim.cmd("bw! " .. tostring(term.buf))
    end
    vim.cmd.wqa()
end
