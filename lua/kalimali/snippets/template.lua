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


--------------------------------------------------------------

return snippets