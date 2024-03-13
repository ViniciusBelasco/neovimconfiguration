return {
	{
		"folke/which-key.nvim",
	},
	{
		"nvim-tree/nvim-web-devicons",
		lazy = false,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		lazy = false,
		main = "ibl",
		opts = {},
	},
	{
		"folke/trouble.nvim",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	{
		"folke/lsp-colors.nvim",
		lazy = false,
		config = function()
			require("lsp-colors").setup()
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		lazy = false,
		config = {},
	},
}
