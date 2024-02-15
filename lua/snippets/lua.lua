local ls = require("luasnip")
local s = ls.s -- > Snippet
local i = ls.i -- > insert
local t = ls.t -- > text node

local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local snippets, autosnippets = {}, {}

local group = vim.api.nvim_create_augroup("Lua Snippets", { clear = true })
local file_pattern = "*.lua"

local sep = s("sep", { t("/*********************************************/") })
local func = s("func", {
	t("static function "),
	i(1, "function_name"),
})

table.insert(snippets, sep)
table.insert(snippets, func)

return snippets, autosnippets
