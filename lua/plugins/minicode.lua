local surround = function()
	require("mini.surround").setup()
end

return {
	{
		"echasnovski/mini.pairs",
		version = false,
		lazy = false,
		opts = {},
		desc = "Toggle auto pairs",
	},
	{
		"echasnovski/mini.surround",
		lazy = false,
		version = false,
		config = surround,
	},
}
