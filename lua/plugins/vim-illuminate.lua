return {
	"RRethy/vim-illuminate",
	config = function()
		-- default configuratioon
		local opts = {
			delay = 200,
			large_file_cutoff = 2000,
			large_file_overrides = {
				providers = { "lsp" },
			},
		}
		require("illuminate").configure(opts)
	end,
}
