local uiconfig = function()
  require("telescope").setup({
 		extensions = {
			["ui-select"] = {
				require("telescope.themes").get_dropdown({}),
			},
		},
	})
	require("telescope").load_extension("ui-select")
end

return 	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = uiconfig
  }
