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
	s(
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
	),
	s(
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
	),
	s(
		"if",
		fmt(
			[[
  if {}
     {}
  endif
]],
			{
				i(1, "condition"),
				i(2, "execution"),
			}
		)
	),
	s(
		"elseif",
		fmt(
			[[
  if {}
     {}
  elseif {}
     {}
  endif
]],
			{
				i(1, "condition1"),
				i(2, "execution1"),
				i(3, "condition2"),
				i(4, "execution2"),
			}
		)
	),
	s(
		"inc",
		fmt(
			[[
  #include {}
]],
			i(1, "module")
		)
	),
	s("del", { i(1, "ALIAS"), t(" ->(RL(), DbDelete(), DbCommit(), DbUnLock(), dbSkip() )") }),
	s(
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
	),
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
			}
		)
	),
	s(
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
				rep(1),
				i(5, "TODO"),
				rep(1, "ALIAS"),
			}
		)
	),
	-- array works
	s(
		"aadd",
		fmt([[AAdd( {}, {} )]], {
			i(1, "array"),
			i(2, "value"),
		})
	),
	s(
		"aclone",
		fmt([[aClone({})]], {
			i(1, "array"),
		})
	),
	s(
		"acopy",
		fmt([[aCopy( {}, {}, {}, {}, {})]], {
			i(1, "aSource"),
			i(2, "aTarget"),
			c(3, { i(1, ""), i(2, "nStart") }),
			c(4, { i(1, ""), i(2, "nCount") }),
			c(5, { i(1, ""), i(2, "nTargetPos") }),
		})
	),
	s(
		"adel",
		fmt([[aDel( {}, {} )]], {
			i(1, "aArray"),
			i(2, "nPos"),
		})
	),
	s(
		"aeval",
		fmt([[aEval( {}, {}, {}, {} )]], {
			i(1, "aArray"),
			i(2, "{||}"),
			c(3, { i(1, ""), i(2, "nStart") }),
			c(4, { i(1, ""), i(2, "nCount") }),
		})
	),
	s(
		"afill",
		fmt([[aFill( {}, {}, {}, {} ))]], {
			i(1, "aArray"),
			i(2, "xValue"),
			c(3, { i(1, ""), i(2, "nStart") }),
			c(4, { i(1, ""), i(2, "nCount") }),
		})
	),
	s(
		"ains",
		fmt(
			[[
      AIns( {}, {})
      ]],
			{
				i(1, "aArray"),
				i(2, "nPos"),
			}
		)
	),
	s(
		"arr",
		fmt(
			[[
      Array( {} )
      ]],
			{
				i(1, "nSize"),
			}
		)
	),
	s(
		"ascan",
		fmt(
			[[
      AScan( {}, {}, {}, {} )
      ]],
			{
				i(1, "aArray"),
				i(2, "{|x|}"),
				c(3, { i(1, ""), i(2, "nStart") }),
				c(4, { i(1, ""), i(2, "nCount") }),
			}
		)
	),
	s(
		"asize",
		fmt(
			[[
      ASize( {}, {} )
      ]],
			{
				i(1, "aArray"),
				i(2, "nLenght"),
			}
		)
	),
	s(
		"asort",
		fmt(
			[[
      ASort( {}, {}, {}, {} )
      ]],
			{
				i(1, "aArray"),
				c(2, { i(1, ""), i(2, "nStart") }),
				c(3, { i(1, ""), i(2, "nCount") }),
				c(4, { i(1, ""), i(2, "bSort") }),
			}
		)
	),
	s("atail", fmt([[ATail( {} )]], { i(1, "aArray") })),
	s(
		"hb_adel",
		fmt(
			[[
      Hb_ADel( {}, {}, {} )
      ]],
			{
				i(1, "aArray"),
				c(2, { i(1, ""), i(2, "nPos") }),
				c(3, { i(1, ""), i(2, "lAutoSize") }),
			}
		)
	),
	s(
		"hb_ains",
		fmt(
			[[
      hb_AIns( {}, {}, {}, {} )
      ]],
			{
				i(1, "aArray"),
				c(2, { i(1, ""), i(2, "nPos") }),
				c(3, { i(1, ""), i(2, "xValue") }),
				c(4, { i(1, ""), i(2, "lAutoSize") }),
			}
		)
	),
	-- database
	s("bof", t("BoF()")),
	s(
		"dbappend",
		fmt(
			[[
    DbAppend({})
    ]],
			{
				c(1, { i(1, ""), i(2, "lLock") }),
			}
		)
	),
	s("dbclearfilter", t("DbClearFilter()")),
	s("dbcloseall", t("DbCloseAll()")),
	s("dbclosearea", t("DbCloseArea()")),
	s("dbcommit", t("DbCommit()")),
	s("dbcommitall", t("DbCommitAll()")),
	s(
		"dbcreate",
		fmt(
			[[
      DbCreate( {}, {}, {}, {}, {}, {}, {}, {} )
      ]],
			{
				i(1, "cFile"),
				i(2, "aStruct"),
				c(3, { i(1, ""), i(2, "cRDD") }),
				c(4, { i(1, ""), i(2, "lKeepOpen") }),
				c(5, { i(1, ""), i(2, "cAlias") }),
				c(6, { i(1, ""), i(2, "cDelimArg") }),
				c(7, { i(1, ""), i(2, "cCodePage") }),
				c(8, { i(1, ""), i(2, "nConnection") }),
			}
		)
	),
	s("dbdelete", t("DbDelete()")),
	s("dbfilter", t("DbFilter()")),
	s("dbgobottom", t("DbGoBottom()")),
	s("dbgoto", fmt([[DbGoTo( {} )]], { i(1, "xRecordNumber") })),
	s("dbgotop", t("DbGoTop()")),
	s("dbrecall", t("DbRecall()")),
	s("dbrlock", fmt([[DbRLock({})]], { i(1, "xIdentity") })),
	s("dbrlocklist", t("DbRLockList()")),
	s("dbrunlock", fmt([[DbRUnlock({})]], { i(1, "xIdentity") })),
	s(
		"dbseek",
		fmt(
			[[
      DbSeek( {}, {}, {} )
      ]],
			{
				i(1, "ExpKey"),
				c(2, { i(1, ""), i(2, "lSoftSeek") }),
				c(3, { i(1, ""), i(2, "lFindLast") }),
			}
		)
	),
	s(
		"dbselectarea",
		fmt(
			[[
      DbSelectArea( {}, {} )
      ]],
			{
				c(1, { i(1, "nArea"), i(2, "xArea") }),
				c(2, { i(1, " "), i(2, "cAlias") }),
			}
		)
	),
	s("dbskip", fmt([[DbSkip({})]], { c(1, { i(1, " "), i(2, "nRecords") }) })),
	s("dbstruct", fmt([[DbStruct()]], {})),
	s("dbunlock", fmt([[DbUnlock()]], {})),
	s("dbunlockall", fmt([[DbUnlockAll()]], {})),
	s(
		"dbusearea",
		fmt(
			[[
      DbUseArea( {}, {}, {}, {}, {}, {} )
      ]],
			{
				c(1, { i(1, ".t."), i(2, ".f."), i(3, " ") }),
				i(2, "cDriver"),
				i(3, "cName"),
				i(4, "xcAlias"),
				c(5, { i(1, ".t."), i(2, ".f."), i(3, " ") }),
				c(6, { i(1, ".t."), i(2, ".f."), i(3, " ") }),
			}
		)
	),
	s("dbf", fmt([[Dbf()]], {})),
	s("deleted", fmt([[Deleted()]], {})),
	s("eof", fmt([[EoF()]], {})),
	s("fcount", fmt([[FCount()]], {})),
	s("fieldget", fmt([[FieldGet( {} )]], { i(1, "nField") })),
	s("fieldname", fmt([[]], {})),
	s("fieldpos", fmt([[]], {})),
	s("fieldput", fmt([[]], {})),
	s("flock", fmt([[]], {})),
	s("found", fmt([[]], {})),
	s("header", fmt([[]], {})),
	s("indexkey", fmt([[]], {})),
	s("indexord", fmt([[]], {})),
	s("lastrec", fmt([[]], {})),
	s("reccount", fmt([[]], {})),
	s("recno", fmt([[]], {})),
	s("recsize", fmt([[]], {})),
	s("rlock", fmt([[]], {})),
	s("select", fmt([[]], {})),
	s("used", fmt([[]], {})),
	-- date
	s("cdow", fmt([[CDoW( {} )]], { i(1, "dDate") })),
	s("cmonth", fmt([[cMonth( {} )]], { i(1, "dDate") })),
	s("ctod", fmt([[CToD( {} )]], { i(1, "cDateString") })),
	s("date", t("Date()")),
	s("day", fmt([[Day( {} )]], { i(1, "cDate") })),
	s("days", fmt([[Days( {} )]], { i(1, "nSeconds") })),
	s("dow", fmt([[DoW( {} )]], { i(1, "dDate") })),
	s("dtoc", fmt([[DToC( {} )]], { i(1, "dDateString") })),
	s("dtos", fmt([[DToS( {} )]], { i(1, "cDateString") })),
	s(
		"elaptime",
		fmt(
			[[
        ElapTime( {}, {} )
      ]],
			{
				i(1, "cStartTime"),
				i(2, "cEndTime"),
			}
		)
	),
	s(
		"dtot",
		fmt(
			[[
      Hb_DToT( {}, {} )
      ]],
			{
				i(1, "cTime"),
				c(2, { i(1, ""), i(2, "cTime"), i(3, "nSeconds") }),
			}
		)
	),
	s("month", fmt([[Month( {} )]], { i(1, "cTime") })),
	s("seconds", t("Seconds()")),
	s("secs", fmt([[Secs( {} )]], { i(1, "cTime") })),
	s("time", t("Time()")),
	s("year", fmt([[Year( {} )]], { i(1, "Date") })),
	-- execution
	s(
		"eval",
		fmt(
			[[
      Eval( {{ | {} | {} }} )
      ]],
			{
				i(1, "bBlock"),
				i(2, "execution"),
			}
		)
	),

	-- System Convertion do not commit
	s(
		"retl",
		fmt(
			[[
      RetornaCodigoLivre( {}, {}, {} )
      ]],
			{
				i(1, "@nFaixa"),
				i(2, "cAlias"),
				i(3, "nIndex"),
			}
		)
	),
}

return snippets, autosnippets
