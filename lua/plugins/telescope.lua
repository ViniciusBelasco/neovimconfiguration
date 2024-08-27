local config = function()
   local telescope = require("telescope")
   local builtinTc = require("telescope.builtin")
   telescope.setup({
      defaults = {
         mappings = {
            i = {
               ["<C-j>"] = "move_selection_next",
               ["<C-k>"] = "move_selection_previous",
               -- Telescope
               vim.keymap.set("n", "<leader>fk", function()
                  builtinTc.keymaps()
               end, {}),
               vim.keymap.set("n", "<leader>fh", function()
                  builtinTc.help_tags()
               end, {}),
               vim.keymap.set("n", "<leader>ff", function()
                  builtinTc.find_files()
               end, {}),
               vim.keymap.set("n", "<leader>fa", function()
                  builtinTc.builtin()
               end, {}),
               vim.keymap.set("n", "<leader>fg", function()
                  builtinTc.live_grep()
               end, {}),
               vim.keymap.set("n", "<leader>fb", function()
                  builtinTc.buffers()
               end, {}),
            },
         },
      },
   })
end

local uiconfig = function()
   require("telescope").setup({
      extensions = {
         ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
         },
      },
   })
   require("telescope").load_extension("ui-select")
end

return {
   {
      "nvim-telescope/telescope-ui-select.nvim",
      config = uiconfig,
   },
   {
      "nvim-telescope/telescope.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      opts = config,
   },
}
