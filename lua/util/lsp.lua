local mapkey = require("util.keymapper").mapvimkey

local M = {}

M.on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	mapkey("n", "<leader>fd", "Lspsaga finder", opts) -- go to definition
	mapkey("n", "<leader>gd", "Lspsaga peek_definition", opts) -- peak definition
	mapkey("n", "<leader>gD", "Lspsaga goto_definition", opts) -- go to definition
	mapkey("n", "<leader>ca", "Lspsaga code_action", opts) -- see available code actions
	mapkey("n", "<leader>rn", "Lspsaga rename", opts) -- smart rename
	mapkey("n", "<leader>D", "Lspsaga show_line_diagnostics", opts) -- show  diagnostics for line
	mapkey("n", "<leader>d", "Lspsaga show_cursor_diagnostics", opts) -- show diagnostics for cursor
	mapkey("n", "<leader>pd", "Lspsaga diagnostic_jump_prev", opts) -- jump to prev diagnostic in buffer
	mapkey("n", "<leader>nd", "Lspsaga diagnostic_jump_next", opts) -- jump to next diagnostic in buffer
	mapkey("n", "K", "Lspsaga hover_doc", opts) -- show documentation for what is under cursor

	if client.name == "pyright" then
		mapkey("n", "<leader>oi", "PyrightOrganizeImports", opts) -- organise imports
		mapkey("n", "<leader>db", "DapToggleBreakpoint", opts) -- toggle breakpoint
		mapkey("n", "<leader>dr", "DapContinue", opts) -- continue/invoke debugger
		mapkey("n", "<leader>dt", "lua require('dap-python').test_method()", opts) -- run tests
	end
end

return M
