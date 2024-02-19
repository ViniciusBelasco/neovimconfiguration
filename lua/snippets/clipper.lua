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

local sep = s("sep", { t("/*******************************************************************************/") })
local func = s(
	"func",
	fmt(
		[[
    static function {}({})
       {}
    return {}
  ]],
		{
			i(1, "function_name"),
			i(2, "parameter"),
			i(3, "TODO"),
			c(4, { t(""), i(1, ".t."), i(2, ".f."), t("var") }),
		}
	)
)

local proc = s(
	"proc",
	fmt(
		[[
  static procedure {}({})
     {}
  return
]],
		{
			i(1, "function_name"),
			i(2, "parameter"),
			i(3, "TODO"),
		}
	)
)

local include = s(
	"inc",
	fmt(
		[[
  #include {}
]],
		i(1, "module")
	)
)

local delete = s("del", { i(1, "ALIAS"), t(" ->(RL(), DbDelete(), DbCommit(), DbUnLock(), dbSkip() )") })

local foreach = s(
	"feach",
	fmt(
		[[
    for each {} in {}
      {}
    next
    ]],
		{
			i(1, "arr"),
			i(2, "arrs"),
			i(3, "do something"),
		}
	)
)

local forloop = s(
	"for",
	fmt(
		[[
      for {} := 1 to Len({})
        {}
      next
    ]],
		{
			i(1, "var"),
			i(2, "var"),
			i(3, "do something"),
		}
	)
)

local dowhile = s(
	"do",
	fmt(
		[[
    do while {}->{} == {} .and. {}->( !EoF() )
       {}
       {}->( dbSkip() )
    enddo
    ]],
		{
			i(1, "ALIAS"),
			i(2, "field"),
			i(3, "value"),
			i(4, "ALIAS"),
			i(5, "TODO"),
			i(6, "ALIAS"),
		}
	)
)

table.insert(snippets, sep)
table.insert(snippets, func)
table.insert(snippets, proc)
table.insert(snippets, include)
table.insert(snippets, delete)
table.insert(snippets, foreach)
table.insert(snippets, forloop)

return snippets, autosnippets
