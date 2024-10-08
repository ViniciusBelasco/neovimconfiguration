return {
	"hrsh7th/nvim-cmp",
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		require("luasnip/loaders/from_vscode").lazy_load()

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			}),
			-- Sources for autocompletion
			sources = cmp.config.sources({
				{ name = "nvim_lsp" }, -- Lsp
				{ name = "luasnip" },
			}, { -- Snippets
				{ name = "buffer" }, -- Text within current buffer
				{ name = "path" }, -- file system paths
			}),
			-- Configure LspKind for vs-code like icons
			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = lspkind.cmp_format({
					maxwidth = 50,
					ellipsis_char = "...",
				}),
			},
			-- For cmdLine inside buffer
		})

		cmp.setup.cmdline({
			{ "/", "?" },
			mapping = cmp.mapping.preset.cmdline(),
			sources = { { name = "buffer" } },
		})
	end,

	dependencies = {
		"onsails/lspkind.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
		{
			"L3MON4D3/LuaSnip",
			version = "2.*",
			build = "make install_jsregexp",
		},
	},
}
