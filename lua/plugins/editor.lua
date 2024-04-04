return {
  {
    "folke/which-key.nvim",
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = false,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    lazy = false,
    main = "ibl",
    opts = {},
  },
  {
    "folke/trouble.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    "folke/lsp-colors.nvim",
    lazy = false,
    config = function()
      require("lsp-colors").setup()
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    config = {},
  },
  --Yank and paste
  {
    "ojroques/nvim-osc52",
    lazy = false,
    config = function()
      require("osc52").setup{}

      -- local keymaps = vim.keymap.set
      -- -- Copy and paste
      -- keymaps("n", "<leader>c", require("osc52").copy_operator, { expr = true, desc = "Copy to clipboard" })
      -- keymaps("n", "<leader>cc", "<leader>c_", { remap = true, desc = "Copy line" })
      -- keymaps("v", "<leader>c", require("osc52").copy_visual, { desc = "Copy current selection" })
    end
  },
}
