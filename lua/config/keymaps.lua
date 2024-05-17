local CR = "<CR>"
local keymaps = vim.keymap.set
local api = vim.api.nvim_set_keymap
local telescope = require("telescope.builtin")

-- Directory Navigation
keymaps("n", "<leader>tf", ":NvimTreeFocus" .. CR, { noremap = true, silent = true })
keymaps("n", "<leader>tt", ":NvimTreeToggle" .. CR, { noremap = true, silent = true })

-- Window Management
keymaps("n", "<leader>sv", ":vsplit" .. CR) -- Vertical Split
keymaps("n", "<leader>sh", ":split" .. CR) -- Horizontal Split
keymaps("n", "<C-Up>", ":resize +2" .. CR)
keymaps("n", "<C-Down>", ":resize -2" .. CR)
keymaps("n", "<C-Right>", ":vertical resize -2" .. CR)
keymaps("n", "<C-Left>", ":vertical resize +2" .. CR)

-- Undo Tree
keymaps("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Show Full File-Path
keymaps("n", "<leader>pa", ":echo expand('%:p')" .. CR) -- Show Full File Path

-- Don't know what it do yet
keymaps("n", "<leader>sm", ":MaximizerToggle" .. CR) -- Toggle Minimiza

-- Save files
keymaps("n", "<leader>w", ":w" .. CR) -- save
keymaps("n", "<leader>q", ":q" .. CR) -- quit

-- Source lua files
keymaps("n", "<leader><leader>", ":so" .. CR) -- source file
-- Source snippets file
keymaps("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua") -- source snippets

-- Indenting
keymaps("v", "<", "<gv", { silent = true, noremap = true })
keymaps("v", ">", ">gv", { silent = true, noremap = true })

-- Move oown and up a selected line.
keymaps("v", "J", ":m '>+1" .. CR .. "gv=gv")
keymaps("v", "K", ":m '<-2" .. CR .. "gv=gv")

--Append line without moving the cursor.
keymaps("n", "J", "mzJ`z")

--Select all page
keymaps("n", "<leader>all", ":keepjumps normal! ggVG" .. CR, {})

-- Pane Navigation
keymaps("n", "<C-h>", "<C-w>h", {}) -- Navigate Left
keymaps("n", "<C-j>", "<C-w>j", {}) -- Navigate Down
keymaps("n", "<C-k>", "<C-w>k", {}) -- Navigate UP
keymaps("n", "<C-l>", "<C-w>l", {}) -- Navigate Right

-- Git keymaps
keymaps("n", "<leader>gc", ":Git" .. CR .. "<C-w>r", {})
keymaps("n", "<leader>gb", ":Git blame" .. CR, {})

-- Comments
api("n", "<C-_>", "gcc", { noremap = false })
api("v", "<C-_>", "gcc", { noremap = false })

-- Vine finder
--Search on current word filtering by current file extension
api("n", "<C-f>", ":Vine" .. CR, {})
api("n", "<leader>f", ":call VineSeek('', '.')", {})

--Open current shown match
api("n", "<leader>" .. CR, ":call VineOpen()" .. CR, {})

-- LuaSnip configuration
-- This expand the current item or jump to the next item within the snippet
keymaps({ "i", "s" }, "<C-x>", function()
	---@diagnostic disable-next-line: undefined-global
	if luasnip.expand_or_jumpable() then
		---@diagnostic disable-next-line: undefined-global
		luasnip.expand_or_jump()
	end
end)

-- Trouble shooting
-- Lua
keymaps("n", "<leader>xx", function()
	require("trouble").toggle()
end)
keymaps("n", "<leader>xw", function()
	require("trouble").toggle("workspace_diagnostics")
end)
keymaps("n", "<leader>xd", function()
	require("trouble").toggle("document_diagnostics")
end)
keymaps("n", "<leader>xq", function()
	require("trouble").toggle("quickfix")
end)
keymaps("n", "<leader>xl", function()
	require("trouble").toggle("loclist")
end)
keymaps("n", "gR", function()
	require("trouble").toggle("lsp_references")
end)

-- Telescope
keymaps("n", "<leader>fk", function()
	telescope.keymaps()
end, {})
keymaps("n", "<leader>fh", function()
	telescope.help_tags()
end, {})
keymaps("n", "<leader>ff", function()
	telescope.find_files()
end, {})
keymaps("n", "<leader>fa", function()
	telescope.builtin()
end, {})
keymaps("n", "<leader>fg", function()
	telescope.live_grep()
end, {})
keymaps("n", "<leader>fb", function()
	telescope.buffers()
end, {})
