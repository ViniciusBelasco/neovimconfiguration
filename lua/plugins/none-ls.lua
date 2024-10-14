return {
   {
      "nvimtools/none-ls.nvim",
      config = function()
         local null_ls = require("null-ls")

         null_ls.setup({
            sources = {
               --Lua
               null_ls.builtins.formatting.stylua,
               --python
               require("none-ls.diagnostics.flake8"),
               null_ls.builtins.formatting.isort,
               null_ls.builtins.formatting.black,
               -- C
               require("none-ls.diagnostics.cpplint"),
               null_ls.builtins.formatting.clang_format,
               -- Html, css, JS
               null_ls.builtins.formatting.prettier,
               null_ls.builtins.diagnostics.erb_lint,
               null_ls.builtins.diagnostics.stylelint,
            },
         })

         vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
      end,
      dependencies = {
         "nvimtools/none-ls-extras.nvim",
      },
   },
}
