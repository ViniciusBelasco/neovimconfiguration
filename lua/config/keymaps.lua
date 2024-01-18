local keymaps = vim.keymap.set
local CR = "<CR>"
local api = vim.api.nvim_set_keymap

-- Directory Navigation
keymaps("n", "<leader>tf", ":NvimTreeFocus" .. CR, { noremap = true, silent = true })
keymaps("n", "<leader>tt", ":NvimTreeToggle" .. CR, { noremap = true, silent = true })

-- Window Management
keymaps("n", "<leader>sv", ":vsplit" .. CR) -- Vertical Split
keymaps("n", "<leader>sh", ":split" .. CR) -- Horizontal Split
keymaps("n", "<C-Up>", ":resize +2" .. CR)
keymaps("n", "<C-Down>", ":resize -2" .. CR)
keymaps("n", "<C-Left>", ":Vertical resize -2" .. CR)
keymaps("n", "<C-Right>", ":Vertical resize -2" .. CR)

-- Show Full File-Path
keymaps("n", "<leader>pa", ":echo expand('%:p')" .. CR) -- Show Full File Path

-- Don't know what it do yet
keymaps("n", "<leader>sm", ":MaximizerToggle" .. CR) -- Toggle Minimiza

-- Save files
keymaps("n", "<leader>w", ":w" .. CR) -- Toggle Minimiza
keymaps("n", "<leader>q", ":q" .. CR) -- Toggle Minimiza

-- Source lua files
keymaps("n", "<leader><leader>", ":so" .. CR) -- Toggle Minimiza

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
keymaps("n", "<leader>gc", vim.cmd.Git, {})
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
