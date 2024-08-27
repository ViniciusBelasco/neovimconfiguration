return {
	-- {
	-- 	"folke/which-key.nvim",
	-- },
	{
		"nvim-tree/nvim-web-devicons",
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = function()
			require("ibl").setup({
				indent = { char = "|" },
				whitespace = { highlight = { "Whitespace", "NonText" } },
			})
		end,
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	{
		"folke/lsp-colors.nvim",
		config = function()
			require("lsp-colors").setup()
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		opts = {},
	},
	--Yank and paste
	{
		"ojroques/nvim-osc52",
		config = function()
			require("osc52").setup({})
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({})
			function Set_terminal_keymaps()
				local opts = { buffer = 0 }
				vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
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
	},
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		opts = {},
		config = function()
			vim.cmd("colorscheme tokyonight-night")
		end,
	},
	{
		"catppuccin/nvim",
	},
   {
      "vim-test/vim-test",
      dependencies = {
         "preservim/vimux"
      },
      config = function()
         vim.keymap.set("n", "<leader>t", ":TestNearest<CR>")
         vim.keymap.set("n", "<leader>T", ":TestFile<CR>")
         vim.keymap.set("n", "<leader>a", ":TestSuite<CR>")
         vim.keymap.set("n", "<leader>l", ":TestLast<CR>")
         vim.keymap.set("n", "<leader>g", ":TestVisit<CR>")
         vim.cmd("let test#strategy = 'vimux'")
      end,
   }
}
