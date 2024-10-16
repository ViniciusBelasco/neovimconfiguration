local keymaps = vim.keymap.set
local api = vim.api.nvim_set_keymap

-- ToggleTerm
keymaps("n", "<leader>tm", ":ToggleTerm direction=horizontal<CR>", {})

-- General keymaps
keymaps("i", "jk", "<ESC>") -- exit insert mode with jk
keymaps("i", "ii", "<ESC>") -- exit insert mode with ii
keymaps("n", "<leader>wq", ":wq<CR>") -- save and quit
keymaps("n", "<leader>qq", ":q!<CR>") -- quit whitout saving
keymaps("n", "<leader>ww", ":w<CR>") -- save

-- Window Management
keymaps("n", "<leader>sv", "<C-w>v" ) -- Split window vertically
keymaps("n", "<leader>sh", "<C-w>s" ) -- Split window horizontally
keymaps("n", "<leader>se", "<C-W>=" ) -- Make split windows equal width
keymaps("n", "<leader>sx", ":close<CR>" ) -- Make split windows equal width
keymaps("n", "<leader>sj", "<C-w>-" ) -- Make split windows height shorter
keymaps("n", "<leader>sk", "<C-w>+" ) -- Make split windows height taller
keymaps("n", "<leader>sl", "<C-w>>5" ) -- Make split windows width bigger
keymaps("n", "<leader>sg", "<C-w><5" ) -- Make split windows width smaller

-- Tab management
keymaps("n", "<leader>to", ":tabnew<CR>") -- open a new tab
keymaps("n", "<leader>tx", ":tabclose<CR>") -- close a tab
keymaps("n", "<leader>tn", ":tabn<CR>") -- next tab
keymaps("n", "<leader>tp", ":tabp<CR>") -- previous tab

-- Diff keymaps
keymaps("n", "<leader>cc", ":diffput<CR>") -- put diff from current to other during diff
keymaps("n", "<leader>cj", ":diffget 1<CR>") -- get diff from left (local) during merge
keymaps("n", "<leader>ck", ":diffget 3<CR>") -- get diff from right (remote) during merge
keymaps("n", "<leader>cn", "]c") -- next diff hunk
keymaps("n", "<leader>cp", "[c") -- previous diff hunk

-- Quickfix keymaps
keymaps("n", "<leader>qn", ":cnext<CR>") -- jump to next quickfix list item
keymaps("n", "<leader>qp", ":cprev<CR>") -- jump to prev quickfix list item

-- Vim-maximizer
keymaps("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle maximize tab

-- Nvim-tree
keymaps("n", "<leader>ee", ":NvimTreeToggle<CR>") -- toggle file explorer
keymaps("n", "<leader>er", ":NvimTreeFocus<CR>") -- toggle focus to file explorer
keymaps("n", "<leader>ef", ":NvimTreeFindFile<CR>") -- find file in file explorer

-- Telescope
keymaps('n', '<leader>ff', require('telescope.builtin').find_files, {})
keymaps('n', '<leader>fg', ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", {})
keymaps('n', '<leader>fb', require('telescope.builtin').buffers, {})
keymaps('n', '<leader>fh', require('telescope.builtin').help_tags, {})
keymaps('n', '<leader>fk', require('telescope.builtin').keymaps, {})
keymaps('n', '<leader>fa', require('telescope.builtin').builtin, {})
keymaps('n', '<leader>fs', require('telescope.builtin').current_buffer_fuzzy_find, {})
keymaps('n', '<leader>fo', require('telescope.builtin').lsp_document_symbols, {})
keymaps('n', '<leader>fi', require('telescope.builtin').lsp_incoming_calls, {})
keymaps('n', '<leader>fm', function() require('telescope.builtin').treesitter({default_text=":method:"}) end)

-- Git
keymaps("n", "<leader>gb", ":GitBlameToggle<CR>") -- toggle git blame
keymaps("n", "<leader>gc", ":Git<CR><C-w>r", {})

-- Harpoon
keymaps("n", "<leader>ha", require("harpoon.mark").add_file)
keymaps("n", "<leader>hh", require("harpoon.ui").toggle_quick_menu)
keymaps("n", "<leader>h1", function() require("harpoon.ui").nav_file(1) end)
keymaps("n", "<leader>h2", function() require("harpoon.ui").nav_file(2) end)
keymaps("n", "<leader>h3", function() require("harpoon.ui").nav_file(3) end)
keymaps("n", "<leader>h4", function() require("harpoon.ui").nav_file(4) end)
keymaps("n", "<leader>h5", function() require("harpoon.ui").nav_file(5) end)
keymaps("n", "<leader>h6", function() require("harpoon.ui").nav_file(6) end)
keymaps("n", "<leader>h7", function() require("harpoon.ui").nav_file(7) end)
keymaps("n", "<leader>h8", function() require("harpoon.ui").nav_file(8) end)
keymaps("n", "<leader>h9", function() require("harpoon.ui").nav_file(9) end)

-- Vim REST Console
keymaps("n", "<leader>xr", ":call VrcQuery()<CR>") -- Run REST query

-- LSP
keymaps('n', '<leader>gg', '<cmd>lua vim.lsp.buf.hover()<CR>')
keymaps('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
keymaps('n', '<leader>gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
keymaps('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
keymaps('n', '<leader>gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
keymaps('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>')
keymaps('n', '<leader>gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
keymaps('n', '<leader>rr', '<cmd>lua vim.lsp.buf.rename()<CR>')
keymaps('n', '<leader>gf', '<cmd>lua vim.lsp.buf.format({async = true})<CR>')
keymaps('v', '<leader>gf', '<cmd>lua vim.lsp.buf.format({async = true})<CR>')
keymaps('n', '<leader>ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
keymaps('n', '<leader>gl', '<cmd>lua vim.diagnostic.open_float()<CR>')
keymaps('n', '<leader>gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
keymaps('n', '<leader>gn', '<cmd>lua vim.diagnostic.goto_next()<CR>')
keymaps('n', '<leader>tr', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
keymaps('i', '<C-Space>', '<cmd>lua vim.lsp.buf.completion()<CR>')

-- Nvim-dap
keymaps("n", "<leader>bb", "<cmd>lua require'dap'.toggle_breakpoint()<cr>")
keymaps("n", "<leader>bc", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>")
keymaps("n", "<leader>bl", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>")
keymaps("n", '<leader>br', "<cmd>lua require'dap'.clear_breakpoints()<cr>")
keymaps("n", '<leader>ba', '<cmd>Telescope dap list_breakpoints<cr>')
keymaps("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>")
keymaps("n", "<leader>dj", "<cmd>lua require'dap'.step_over()<cr>")
keymaps("n", "<leader>dk", "<cmd>lua require'dap'.step_into()<cr>")
keymaps("n", "<leader>do", "<cmd>lua require'dap'.step_out()<cr>")
keymaps("n", '<leader>dd', function() require('dap').disconnect(); require('dapui').close(); end)
keymaps("n", '<leader>dt', function() require('dap').terminate(); require('dapui').close(); end)
keymaps("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>")
keymaps("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>")
keymaps("n", '<leader>di', function() require "dap.ui.widgets".hover() end)
keymaps("n", '<leader>d?', function() local widgets = require "dap.ui.widgets"; widgets.centered_float(widgets.scopes) end)
keymaps("n", '<leader>df', '<cmd>Telescope dap frames<cr>')
keymaps("n", '<leader>dh', '<cmd>Telescope dap commands<cr>')
keymaps("n", '<leader>de', function() require('telescope.builtin').diagnostics({default_text=":E:"}) end)

-- Trouble
keymaps("n", '<leader>xx', ':Trouble diagnostics toggle<CR>', { desc = "Diagnostics (Trouble)"})

-- Indenting
keymaps("v", "<", "<gv", { silent = true, noremap = true })
keymaps("v", ">", ">gv", { silent = true, noremap = true })

-- Move oown and up a selected line.
keymaps("v", "J", ":m '>+1<CR>gv=gv")
keymaps("v", "K", ":m '<-2<CR>gv=gv")

--Append line without moving the cursor.
keymaps("n", "J", "mzJ`z")

--Select all page
keymaps("n", "<leader>all", ":keepjumps normal! ggVG<CR>", {})

-- Pane Navigation
keymaps("n", "<c-h>", ":wincmd h<CR>", {}) -- Navigate Left
keymaps("n", "<c-j>", ":wincmd j<CR>", {}) -- Navigate Down
keymaps("n", "<c-k>", ":wincmd k<CR>", {}) -- Navigate UP
keymaps("n", "<c-l>", ":wincmd l<CR>", {}) -- Navigate Right

-- Comments
api("n", "<C-_>", "gcc", { noremap = false })
api("v", "<C-_>", "gcc", { noremap = false })

-- tmux pane Navigation
keymaps("n", "<C-h>", ":TmuxNavigateLeft<CR>") -- Navigate Left
keymaps("n", "<C-j>", ":TmuxNavigateDown<CR>") -- Navigate Down
keymaps("n", "<C-k>", ":TmuxNavigateUp<CR>") -- Navigate UP
keymaps("n", "<C-l>", ":TmuxNavigateRight<CR>") -- Navigate Right

-- LuaSnip configuration
-- This expand the current item or jump to the next item within the snippet
keymaps({ "i", "s" }, "<C-x>", function()
   ---@diagnostic disable-next-line: undefined-global
   if luasnip.expand_or_jumpable() then
      ---@diagnostic disable-next-line: undefined-global
      luasnip.expand_or_jump()
   end
end)

-- Useful but uncommon
keymaps("n", "<leader>u", vim.cmd.UndotreeToggle) -- open undotree
keymaps("n", "<leader>pa", ":echo expand('%:p')<CR>") -- Show Full File Path
keymaps("n", "<leader><leader>", ":so<CR>") -- source file
keymaps("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua") -- source snippets

