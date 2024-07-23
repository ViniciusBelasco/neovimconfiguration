local on_attach = require("util.lsp").on_attach
local icons = require("util.icons").diagnostic_signs

local config = function()
	local lspconfig = require("lspconfig")
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
	lspconfig.lua_ls.setup({
    on_attach = on_attach,
    			lua = { -- custom settings for lua
				-- make the language server recogniza "vim" global
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					-- Make language server aware of runtime files
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.stdpath("config") .. "/lua"] = true,
					},
				},
			},

  })
  lspconfig.tsserver.setup({capabilities=capabilities})
  lspconfig.pyright.setup({capabilities=capabilities})

	for type, icon in pairs(icons) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end
end

return {
	"neovim/nvim-lspconfig",
	config = config,
	dependencies = {
		"windwp/nvim-autopairs",
		"williamboman/mason.nvim",
	},
}
