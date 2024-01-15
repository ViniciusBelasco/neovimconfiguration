local mapkey = require("util.keymapper").mapvimkey
local api = vim.api

-- Directory Navigation
mapkey("n", "<leader>tf", "NvimTreeFocus", { noremap = true, silent = true })
mapkey("n", "<leader>tt", "NvimTreeToggle", { noremap = true, silent = true })

-- Window Management
mapkey("n", "<leader>sv", "vsplit") -- Vertical Split
mapkey("n", "<leader>sh", "split") -- Horizontal Split
mapkey("n", "<C-Up>", "resize +2")
mapkey("n", "<C-Down>", "resize -2")
mapkey("n", "<C-Left>", "Vertical resize -2")
mapkey("n", "<C-Right>", "Vertical resize -2")

-- Show Full File-Path
mapkey("n", "<leader>pa", "echo expand('%:p')") -- Show Full File Path

-- Don't know what it do yet
mapkey("n", "<leader>sm", "MaximizerToggle") -- Toggle Minimiza

-- Save files
mapkey("n", "<leader>w", "w") -- Toggle Minimiza
mapkey("n", "<leader>q", "q") -- Toggle Minimiza

-- Source lua files
mapkey("n", "<leader><leader>", "so") -- Toggle Minimiza

-- Indenting
vim.keymap.set("v", "<", "<gv", { silent = true, noremap = true })
vim.keymap.set("v", ">", ">gv", { silent = true, noremap = true })

-- Move oown and up a selected line.
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--Append line without moving the cursor.
vim.keymap.set("n", "J", "mzJ`z")

--Select all page
vim.keymap.set("n", "<leader>all", ":keepjumps normal! ggVG<cr>")

-- Pane Navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", {}) -- Navigate Left
vim.keymap.set("n", "<C-j>", "<C-w>j", {}) -- Navigate Down
vim.keymap.set("n", "<C-k>", "<C-w>k", {}) -- Navigate UP
vim.keymap.set("n", "<C-l>", "<C-w>l", {}) -- Navigate Right

-- Comments
api.nvim_set_keymap("n", "<C-_>", "gcc", { noremap = false })
api.nvim_set_keymap("v", "<C-_>", "gcc", { noremap = false })

-- Vine finder
--Search on current word filtering by current file extension
vim.api.nvim_set_keymap("n", "<C-f>", ":Vine<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>f", ":call VineSeek('', '.')", {})

--Open current shown match
vim.api.nvim_set_keymap("n", "<leader><CR>", ":call VineOpen()<CR>", {})

