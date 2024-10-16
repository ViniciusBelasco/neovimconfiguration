return {
   "lukas-reineke/indent-blankline.nvim",
   event = 'VeryLazy',
   main = "ibl",
   config = function()
      require("ibl").setup({
      indent = { char = "|" },
      whitespace = { highlight = { "Whitespace", "NonText" } },
      })
   end,
}
