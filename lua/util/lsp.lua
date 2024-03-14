local keymaps = vim.keymap.set

local M = {}

M.on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	keymaps("n", "<leader>fd", ":Lspsaga finder<CR>", opts) -- go to definition
	keymaps("n", "<leader>gd", ":Lspsaga peek_definition<CR>", opts) -- peak definition
	keymaps("n", "<leader>gD", ":Lspsaga goto_definition<CR>", opts) -- go to definition
	keymaps("n", "<leader>ca", ":Lspsaga code_action<CR>", opts) -- see available code actions
	keymaps("n", "<leader>rn", ":Lspsaga rename<CR>", opts) -- smart rename
	keymaps("n", "<leader>D", ":Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
	keymaps("n", "<leader>d", ":Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
	keymaps("n", "<leader>pd", ":Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to prev diagnostic in buffer
	keymaps("n", "<leader>nd", ":Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
	keymaps("n", "K", ":Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
	-- Toggle Terminal
	keymaps("n", "<leader>tm", "<cmd>Lspsaga term_toggle<CR>", opts)

	if client.name == "pyright" then
		keymaps("n", "<leader>oi", ":PyrightOrganizeImports<CR>", opts) -- organise imports
		keymaps("n", "<leader>db", ":DapToggleBreakpoint<CR>", opts) -- toggle breakpoint
		keymaps("n", "<leader>dr", ":DapContinue<CR>", opts) -- continue/invoke debugger
		keymaps("n", "<leader>dt", ":lua require('dap-python').test_method()<CR>", opts) -- run tests
	end
end

return M
