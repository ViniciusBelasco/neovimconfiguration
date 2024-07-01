local surround = function()
	require("mini.surround").setup()
end

local comment = function()
	require("mini.comment").setup()
end

return {
	{
		"echasnovski/mini.pairs",
		version = false,
		lazy = false,
		opts = {},
		desc = "Auto pairs",
	},
	{
		"echasnovski/mini.surround",
		lazy = false,
		version = false,
		config = surround,
	},
	{
		"echasnovski/mini.comment",
		version = false,
		lazy = false,
		config = comment,
	},
	{
		"windwp/nvim-ts-autotag",
		lazy = false,
		opts = {},
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
	},
}
