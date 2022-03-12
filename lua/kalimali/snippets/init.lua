if not pcall(require, "luasnip") then
	return
end

local should_reload = true
local reloader = function()
	if should_reload then
		RELOAD "luasnip"
		RELOAD "luasnip.util.types"
	end
end

reloader()
local ls = require('luasnip')
local types = require('luasnip.util.types')

local languages = { "all", "python", "cpp" }

ls.config.set_config {
	history = true,
	updateevents = "TextChanged,TextChangedI",
	enable_autosnippets = true,
	-- ext_opts = nil,
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "<-", "Error" } },
			},
		},
	},
}


local snippets = {
	all = {},
	python = {},
	cpp = {},
	lua = {},
}

for _, lang in ipairs(languages)
do
	snippets[lang] = RELOAD('kalimali.snippets.' .. lang)
end

ls.snippets = snippets


vim.keymap.set(
	{ "i", "s" },
	"<c-j>",
	function()
		if ls.expand_or_jumpable() then
			ls.expand_or_jump()
		end
	end,
	{ silent = true }
)

vim.keymap.set(
	{ "i", "s" },
	"<c-k>",
	function()
		if ls.jumpable(-1) then
			ls.jump(-1)
		end
	end,
	{ silent = true }
)

vim.keymap.set(
	{ "i" },
	"<c-l>",
	function()
		if ls.choice_active() then
			ls.change_choice(1)
		end
	end,
	{ silent = true }
)

-- shorcut to source my luasnips file again, which will reload my snippets
vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/lua/kalimali/snippets/init.lua<CR>")
