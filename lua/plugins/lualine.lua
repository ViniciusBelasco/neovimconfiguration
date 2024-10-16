-- Status line
return {
   "nvim-lualine/lualine.nvim",
   dependencies = {
      "nvim-tree/nvim-web-devicons", -- fancy icons
      "linrongbin16/lsp-progress.nvim", -- LSP loading progress
   },
   config = function()
      local theme = require("lualine.themes.codedark")
      theme.normal.c.bg = nil

      require("lualine").setup({
         options = {
            theme = theme,

            globalstatus = true,
            icons_enabled = true,
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },

            disabled_filetypes = {
               statusline = {},
               winbar = {},
            },

            ignore_focus = {},
            always_divide_middle = true,

            refresh = {
               statusline = 1000,
               tabline = 1000,
               winbar = 1000,
            },
         },

         sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch", "diff", "diagnostics" },
            lualine_c = { 
                           { "filename",
                              file_status = true, -- Displays file status (readonly status, modified status)
                              newfile_status = false, -- Display new file status (new file means no write after created)
                              path = 4, -- 0: Just the filename
                                        -- 1: Relative path
                                        -- 2: Absolute path
                                        -- 3: Absolute path, with tilde as the home directory
                                        -- 4: Filename and parent dir, with tilde as the home directory 
                               symbols = {
                                            modified = '[+]',      -- Text to show when the file is modified.
                                            readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
                                          },
                           } },
            lualine_x = { "encoding", "fileformat", "filetype" },
            lualine_y = { "progress" },
            lualine_z = { "location" },
         },
         inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { "filename" },
            lualine_x = { "location" },
            lualine_y = {},
            lualine_z = {},
         },
         tabline = {},
         winbar = {},
         inactive_winbar = {},
         extensions = {},
      })
   end,
}
