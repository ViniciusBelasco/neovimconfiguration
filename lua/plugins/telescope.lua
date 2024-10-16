return {
   {
      "nvim-telescope/telescope.nvim",
      lazy = true,
      dependencies = {
         { "nvim-lua/plenary.nvim" },
         {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            cond = function()
               return vim.fn.executable("make") == 1
            end,
         },
         {
            "nvim-telescope/telescope-live-grep-args.nvim",
         },
      },
      opts = {
         defaults = {
            layout_config = {
               vertical = {
                  width = 0.75,
               },
            },
         },
      },
      config = function()
         local telescope = require("telescope")

         -- first setup telescope
         telescope.setup({
            defaults = {
               mappings = {
                  i = {
                     ["<C-j>"] = "move_selection_next",
                     ["<C-k>"] = "move_selection_previous",
                  },
               },
            },
         })

         -- then load the extension
         telescope.load_extension("live_grep_args")
      end,
   },
   {
      "nvim-telescope/telescope-ui-select.nvim",
      config = function()
         extensions = {
            ["ui-select"] = {
               require("telescope.themes").get_dropdown({}),
            },
            require("telescope").load_extension("ui-select"),
         }
      end,
   },
}
