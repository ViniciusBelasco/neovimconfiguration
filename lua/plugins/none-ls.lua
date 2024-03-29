return {
	{
		"nvimtools/none-ls.nvim",
		lazy = false,
		config = function()
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					--Lua
					null_ls.builtins.formatting.stylua,
					--python
					require('none-ls.diagnostics.flake8'),
					null_ls.builtins.formatting.isort,
					null_ls.builtins.formatting.black,
				},
			})

			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
		end,
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
		},
	},
}
