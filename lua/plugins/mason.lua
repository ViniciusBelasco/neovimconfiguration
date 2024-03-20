local config = function ()
  require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "tsserver" },
    automatic_installation = true,
  })
end

local lspfunction = function()
	require("mason").setup({
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	})
end

return {
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		event = "BufReadPre",
		config = lspfunction,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = config,
		event = "BufReadPre",
		dependencies = "williamboman/mason.nvim",
	},
}
