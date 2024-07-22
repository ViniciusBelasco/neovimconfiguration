vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Example using a list of specs with the default options
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
   -- bootstrap lazy.nvim
   -- stylua: ignore
	vim.fn.system({"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

local opts = {
	defaults = {
      -- by default, only LazyVim plugins will be lazy-loaded. Your custom plugins will lead during startup.
      -- If you know what you're doing, you can set to this to `true` to have all your custom plugins lazy-loaded by default
		lazy = false,
      -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
      -- have outdated releases, which may break your Neovim install.
      --version = true, -- always use the latest git commit
      version = "*", -- try installing the latest stable version for plugins that support semver
	},
	install = {
		colorscheme = { "tokyonight", "catppuccin" },
	},
   checker = { enable = true }, -- Automatically check for plugin updates
   performance = {
      rtp = {
         disabled_plugins = {
            "gzip",
            "matchit",
            "matchparen",
            "netrwPlugin",
            "tarPlugin",
            "tohtml",
            "tutor",
            "zipPlugin",
         },
      },
   },
	change_detection = {
		notify = true,
	},
}

require("lazy").setup("plugins", opts)

require("config.globals")
require("config.options")
require("config.keymaps")
require("config.autocmds")
--require("config.sgames")
