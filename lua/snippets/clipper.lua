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

local autosnippets = {}

local group = vim.api.nvim_create_augroup("Lua Snippets", { clear = true })
local file_pattern = "*.lua"

local snippets = {
  s("sep", { t("/*******************************************************************************/") }),
  s("func",
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
	) ),
  s("proc",
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
		} ) ),
  s("inc",
	fmt(
		[[
  #include {}
]],
		i(1, "module")
	) ),
  s("del", { i(1, "ALIAS"), t(" ->(RL(), DbDelete(), DbCommit(), DbUnLock(), dbSkip() )") }),
  s("feach",
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
		} ) ),
  s(
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
		} ) ),
  s("do",
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
		}	) ),
  s("aadd", fmt(
    [[AAdd( {}, {} )]],
    {
      i(1, "array"),
      i(2, "value"),
    }
  ) ),
  -- array works
  s("aclone", fmt([[]],{}) ),
  s("acopy", fmt([[]],{}) ),
  s("adel", fmt([[]],{}) ),
  s("aeval", fmt([[]],{}) ),
  s("afill", fmt([[]],{}) ),
  s("ains", fmt([[]],{}) ),
  s("arr", fmt([[]],{}) ),
  s("ascan", fmt([[]],{}) ),
  s("asize", fmt([[]],{}) ),
  s("asort", fmt([[]],{}) ),
  s("atail", fmt([[]],{}) ),
  s("afields", fmt([[]],{}) ),
  -- database
  s("bof", fmt([[]],{}) ),
  s("dbappend", fmt([[]],{}) ),
  s("dbclearfilter", fmt([[]],{}) ),
  s("dbcloseall", fmt([[]],{}) ),
  s("dbclosearea", fmt([[]],{}) ),
  s("dbcommit", fmt([[]],{}) ),
  s("dbcommitall", fmt([[]],{}) ),
  s("dbcreate", fmt([[]],{}) ),
  s("dbdelete", fmt([[]],{}) ),
  s("dbfilter", fmt([[]],{}) ),
  s("dbgobottom", fmt([[]],{}) ),
  s("dbgoto", fmt([[]],{}) ),
  s("dbgotop", fmt([[]],{}) ),
  s("dbrecall", fmt([[]],{}) ),
  s("dbrlock", fmt([[]],{}) ),
  s("dbrlocklist", fmt([[]],{}) ),
  s("dbrunlock", fmt([[]],{}) ),
  s("dbseek", fmt([[]],{}) ),
  s("dbselectarea", fmt([[]],{}) ),
  s("dbskip", fmt([[]],{}) ),
  s("dbstruct", fmt([[]],{}) ),
  s("dbunlock", fmt([[]],{}) ),
  s("dbunlockall", fmt([[]],{}) ),
  s("dbusearea", fmt([[]],{}) ),
  s("dbf", fmt([[]],{}) ),
  s("deleted", fmt([[]],{}) ),
  s("eof", fmt([[]],{}) ),
  s("fcount", fmt([[]],{}) ),
  s("fieldget", fmt([[]],{}) ),
  s("fieldname", fmt([[]],{}) ),
  s("fieldpos", fmt([[]],{}) ),
  s("fieldput", fmt([[]],{}) ),
  s("flock", fmt([[]],{}) ),
  s("found", fmt([[]],{}) ),
  s("header", fmt([[]],{}) ),
  s("indexkey", fmt([[]],{}) ),
  s("indexord", fmt([[]],{}) ),
  s("lastrec", fmt([[]],{}) ),
  s("reccount", fmt([[]],{}) ),
  s("recno", fmt([[]],{}) ),
  s("recsize", fmt([[]],{}) ),
  s("rlock", fmt([[]],{}) ),
  s("select", fmt([[]],{}) ),
  s("used", fmt([[]],{}) ),
  -- date
  s("cdow", fmt([[]],{}) ),
  s("cmonth", fmt([[]],{}) ),
  s("ctod", fmt([[]],{}) ),
  s("date", fmt([[]],{}) ),
  s("day", fmt([[]],{}) ),
  s("days", fmt([[]],{}) ),
  s("dow", fmt([[]],{}) ),
  s("dtoc", fmt([[]],{}) ),
  s("dtos", fmt([[]],{}) ),
  s("elaptime", fmt([[]],{}) ),
  s("month", fmt([[]],{}) ),
  s("seconds", fmt([[]],{}) ),
  s("secs", fmt([[]],{}) ),
  s("time", fmt([[]],{}) ),
  s("year", fmt([[]],{}) ),
  -- execution
  s("eval", fmt([[Eval({})]],{i(1, "bBlock")}) ),
}

return snippets, autosnippets
