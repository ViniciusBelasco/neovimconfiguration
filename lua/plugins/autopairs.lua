local surround = function()
	require("mini.surround").setup()
end

return {
	{
		"windwp/nvim-autopairs",
		lazy = false,
		event = "InsertEnter",
		opts = {}, -- this is equalent to setup({}) function
	},
	{
		"echasnovski/mini.surround",
    lazy = false,
		version = false,
		config = surround,
	},
}
