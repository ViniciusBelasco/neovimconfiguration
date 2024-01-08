local keymap = vim.keymap
local api = vim.api

-- Directory Navigation
keymap.set('n', '<leader>tf', ':NvimTreeFocus<CR>', { noremap = true, silent = true })
keymap.set('n', '<leader>tt', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Pane Navigation
keymap.set('n', '<C-h>', '<C-w>h', opts) -- Navigate Left
keymap.set('n', '<C-j>', '<C-w>j', opts) -- Navigate Left
keymap.set('n', '<C-k>', '<C-w>k', opts) -- Navigate Left
keymap.set('n', '<C-l>', '<C-w>l', opts) -- Navigate Left

-- Window Management
keymap.set('n', '<leader>sv', ':vsplit<CR>', opts) -- Vertical Split
keymap.set('n', '<leader>sh', ':split<CR>', opts) -- Horizontal Split
-- Don't know what it do yet
keymap.set('n', '<leader>sm', ':MaximizerToggle<CR>', opts) -- Toggle Minimiza 

-- Save files
keymap.set('n', '<leader>w', ':w<CR>', opts) -- Toggle Minimiza
keymap.set('n', '<leader>q', ':q<CR>', opts) -- Toggle Minimiza

-- Source lua files
keymap.set('n', '<leader><leader>', ':so<CR>', opts) -- Toggle Minimiza

-- Indenting
keymap.set("v","<", "<gv")
keymap.set("v",">", ">gv")

-- Comments
api.nvim_set_keymap( 'n', "<C-_>", "gcc", { noremap = false } )
api.nvim_set_keymap( 'v', "<C-_>", "gcc", { noremap = false } )
