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
			t"def ", i(1, "func_name"), t"(", i(2, " "), t"):",
			newline,
			tab, i(3, "# Body"), i(0),
			newline,
			tab, t"pass"
		}
	)
)
table.insert(
	snippets,
	snippet(
		"p",
		{
			t"print(", i(1, ""), t")"
		}
	)
)
-- table.insert(
-- 	snippets,
-- 	snippet(
-- 		"pd",
-- 		{
-- 			t"print(", i(1, ""), t")"
-- 		}
-- 	)
-- )

--------------------------------------------------------------

return snippets
