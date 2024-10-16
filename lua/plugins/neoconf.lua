return {
   "folke/neoconf.nvim",
   cmd = "Neoconf",
   lazy = false,
   config = function()
      require("neoconf").setup({})
   end,
}
