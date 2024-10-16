-- Set filetype to `bigfile` for files larger than 1.5 MB
-- Only vim syntax will be enabled (with the correct filetype)
-- LSP, treesitter and other ft plugins will be disabled.
-- mini.animate will also be disabled.
vim.g.bigfile_size = 1024 * 1024 * 1.5 -- 1.5 MB

--Auto format
vim.g.autoformat = true

local opt = vim.opt

-- Tab / Indetation
opt.tabstop = 3
opt.shiftwidth = 3
opt.softtabstop = 3
opt.expandtab = true --use spaces instead of tabs
opt.smartindent = true
opt.wrap = false
opt.autowrite = true
opt.smoothscroll = true
opt.foldlevel=20
opt.foldmethod="expr"
opt.foldexpr="nvim_treesitter#foldexpr()"
opt.foldtext = ""

-- Search itens
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true

-- Appearance
opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.colorcolumn = "72"
opt.signcolumn = "yes"
opt.cmdheight = 1
opt.scrolloff = 10
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 2
opt.confirm = true -- Confirm to save a modified buffer before leave
opt.cursorline = true
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.inccommand = "nosplit" -- preview incremental substitute
opt.jumpoptions = "view"
opt.laststatus = 3         -- global statusline
opt.linebreak = true       -- wrap lines at convenient points
opt.list = true            -- show some invisible characters
opt.pumblend = 10          -- Popup blend
opt.pumheight = 10         -- maximum number of entries in a pop
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opt.shiftround = true      -- round indent
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.showmode = false       -- Dont show mode since we have a statusline
opt.sidescrolloff = 8      -- Columns of context
opt.spelllang = { "en" }
opt.spelloptions:append("noplainbuffer")
opt.splitkeep = "screen"

-- Behavior
opt.hidden = true
opt.errorbells = false
opt.swapfile = false
opt.backup = false
opt.undodir = vim.fn.expand("~/.vim/undodir")
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200
opt.virtualedit = "block"
opt.wildmode = "longest:full,full" -- command-line completion mode
opt.winminwidth = 5                -- Minimum window width
opt.backspace = "indent,eol,start"
opt.splitright = true
opt.splitbelow = true
opt.autochdir = false
opt.iskeyword:append("-")
opt.mouse:append("a")
opt.clipboard:append("unnamedplus")
opt.modifiable = true
opt.encoding = "UTF-8"
vim.opt.completeopt = "menu,menuone,noselect"

opt.fillchars = {
   foldopen = "",
   foldclose = "",
   fold = " ",
   foldsep = " ",
   diff = "╱",
   eob = " ",
}
