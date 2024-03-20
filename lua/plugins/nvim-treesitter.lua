local config = function()
	require("nvim-treesitter.configs").setup({
    build = ":TSUpdate",
		indent = { enable = true, },
		autotag = { enable = true, },
		ensure_installed = {
			"markdown",
			"markdown_inline",
			"json",
			"javascript",
			"typescript",
			"yaml",
			"html",
			"css",
			"bash",
			"lua",
			"dockerfile",
			"solidity",
			"gitignore",
			"python",
			"vue",
			"c",
			"cpp",
		},
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = true,
		},
	})
end

return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	config = config,
}
