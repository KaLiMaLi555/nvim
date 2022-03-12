local ls = require('luasnip')
local types = require('luasnip.util.types')

local snippet = ls.s
local snippet_from_nodes = ls.sn
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local l = require("luasnip.extras").lambda
local events = require "luasnip.util.events"

local newline = t { "", "" }
local tab = t { "    " }

--------------------------------------------------------------

local snippets = {}


table.insert(
	snippets,
	snippet(
		"func",
		{
			i(1, "return_type"), t" ", i(2, "func_name"), t"(", i(3, " "), t")",
			newline,
			t "{",
			newline,
			tab, i(4, "// Body"),
			newline,
			tab, t"return", i(5, ""), t";",
			newline,
			t"}", i(0)
		}
	)
)
table.insert(
	snippets,
	snippet(
		"p",
		{
			t"std::cout(", i(1, ""), t")", i(0)
		}
	)
)
table.insert(
	snippets,
	snippet(
		"pd",
		{
			t"std::cout(", i(1, ""), t")", i(0)
		}
	)
)

--------------------------------------------------------------

return snippets
