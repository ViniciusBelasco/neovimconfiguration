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
	--Yank and paste
	{
		"ojroques/nvim-osc52",
		lazy = false,
		config = function()
			require("osc52").setup({})
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		lazy = false,
		version = "*",
		config = function()
			require("toggleterm").setup()

			function Set_terminal_keymaps()
				local opts = { buffer = 0 }
				vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
				vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
				vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
				vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
				vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
				vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
				vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
			end

			vim.cmd("autocmd! TermOpen term://* lua Set_terminal_keymaps()")
		end,
	},
	{
		"mbbill/undotree",
		lazy = false,
	},
}
