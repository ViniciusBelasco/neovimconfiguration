return {
	"L3MON4D3/LuaSnip",
	version = "2.*",
	build = "make install_jsregexp",
	lazy = false,
	config = function()
		local ls = require("luasnip")

		require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets/" })

		local types = require("luasnip.util.types")

		ls.config.set_config({
			history = true,
			updateevents = "TextChanged, TextChangedI",
			enable_autosnippets = true,
			ext_opts = {
				[types.choiceNode] = {
					active = {
						virt_text = { { "●", "GruvboxOrange" } },
					},
				},
			},
		})

		--Key Maps
		vim.keymap.set({ "i", "s" }, "<a-p>", function()
			if ls.expand_or_jumpable() then
				ls.expand()
			end
		end)

		vim.keymap.set({ "i", "s" }, "<a-k>", function()
			if ls.jumpable(1) then
				ls.jump(1)
			end
		end)

		vim.keymap.set({ "i", "s" }, "<a-j>", function()
			if ls.jumpable(-1) then
				ls.jump(-1)
			end
		end)

		vim.keymap.set({ "i", "s" }, "<a-l>", function()
			if ls.choice_active() then
				ls.change_choice(1)
			end
		end)

		vim.keymap.set({ "i", "s" }, "<a-h>", function()
			if ls.choice_active() then
				ls.choice_active(-1)
			end
		end)
	end,
}
