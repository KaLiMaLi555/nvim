local npairs = require('nvim-autopairs')

npairs.setup({
    check_ts = true,
    ts_config = {
        lua = {"string", "source"},
        python = {"string", "source"},
    },
    disable_filetype = { "TelescopePrompt" , "vim" },
    fast_wrap = {
        map = "<C-e>",
        chars = {"{", "[", "(", '"', "'"},
        pattern = [=[[%'%"%)%>%]%)%}%,]]=],
        offset = 0,
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
    }
})

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done{map_char = {tex = ""}})
