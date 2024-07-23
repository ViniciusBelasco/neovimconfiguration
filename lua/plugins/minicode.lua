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
		opts = {},
		desc = "Auto pairs",
	},
	{
		"echasnovski/mini.surround",
		version = false,
		config = surround,
	},
	{
		"echasnovski/mini.comment",
		version = false,
		config = comment,
	},
	{
		"windwp/nvim-ts-autotag",
		opts = {},
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
	},
}
