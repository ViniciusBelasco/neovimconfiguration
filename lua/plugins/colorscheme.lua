return {
   "folke/tokyonight.nvim",
   lazy = false,  -- We want the colorscheme to load immediately when starting Neovim
   priority = 1000, -- Load the colorscheme before other non-lazy-loaded plugins
   opts = {},
   config = function()
      vim.cmd("colorscheme tokyonight-night")
   end,
}
