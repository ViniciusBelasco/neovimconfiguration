local keymaps = vim.keymap.set

local M = {}

M.on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	keymaps("n", "<leader>fd", "Lspsaga finder", opts) -- go to definition
	keymaps("n", "<leader>gd", "Lspsaga peek_definition", opts) -- peak definition
	keymaps("n", "<leader>gD", "Lspsaga goto_definition", opts) -- go to definition
	keymaps("n", "<leader>ca", "Lspsaga code_action", opts) -- see available code actions
	keymaps("n", "<leader>rn", "Lspsaga rename", opts) -- smart rename
	keymaps("n", "<leader>D", "Lspsaga show_line_diagnostics", opts) -- show  diagnostics for line
	keymaps("n", "<leader>d", "Lspsaga show_cursor_diagnostics", opts) -- show diagnostics for cursor
	keymaps("n", "<leader>pd", "Lspsaga diagnostic_jump_prev", opts) -- jump to prev diagnostic in buffer
	keymaps("n", "<leader>nd", "Lspsaga diagnostic_jump_next", opts) -- jump to next diagnostic in buffer
	keymaps("n", "K", "Lspsaga hover_doc", opts) -- show documentation for what is under cursor

	if client.name == "pyright" then
		keymaps("n", "<leader>oi", "PyrightOrganizeImports", opts) -- organise imports
		keymaps("n", "<leader>db", "DapToggleBreakpoint", opts) -- toggle breakpoint
		keymaps("n", "<leader>dr", "DapContinue", opts) -- continue/invoke debugger
		keymaps("n", "<leader>dt", "lua require('dap-python').test_method()", opts) -- run tests
	end
end

return M
