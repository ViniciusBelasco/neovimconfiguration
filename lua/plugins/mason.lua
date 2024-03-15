local opts = {
	ensure_installed = { "efm", "lua_ls" },
	automatic_installation = true,
}

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
		opts = opts,
		event = "BufReadPre",
		dependencies = "williamboman/mason.nvim",
	},
}
