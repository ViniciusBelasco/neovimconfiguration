local function iconDiagnostics()

   local M = {}

   M.debugging_signs = {
      Stopped = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
      Breakpoint = " ",
      BreakpointCondition = " ",
      BreakpointRejected = { " ", "DiagnosticError" },
      LogPoint = ".>",
   }

   M.diagnostic_signs = {
      Error = " ",
      Warn = " ",
      Hint = "",
      Info = "",
   }

   return M
end

-- LSP Support
return {
   -- LSP Configuration
   "neovim/nvim-lspconfig",
   event = "VeryLazy",
   dependencies = {
      -- LSP Manager Plugins
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },

      -- Useful status updates for LSP
      { "j-hui/fidget.nvim",                opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      { "folke/neodev.nvim" },
   },
   config = function()
      local masonLspConfig = require("mason-lspconfig")
      require("mason").setup()
      masonLspConfig.setup({
         -- Update this list to language servers you need installed
         ensure_installed = {
            -- "bashls", # requires npm to be installed
            -- "cssls", # requires npm to be installed
            -- "html", # requires npm to be installed
            --"gradle_ls",
            --"groovyls",
            "lua_ls",
            -- "intelephense", # requires npm to be installed
            -- "jsonls", # requires npm to be installed
            --"lemminx",
            --"marksman",
            --"quick_lint_js",
            -- "tsserver", # requires npm to be installed
            -- "yamlls", # requires npm to be installed
         },
      })

      local icons = iconDiagnostics().diagnostic_signs

      for type, icon in pairs(icons) do
         local hl = "DiagnosticSign" .. type
         vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      local lspconfig = require("lspconfig")
      local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lsp_attach = function(client, bufnr)
         local opts = { noremap = true, silent = true, buffer = bufnr }

         vim.keymap.set("n", "<leader>fd", ":Lspsaga finder<CR>", opts)           -- go to definition
         vim.keymap.set("n", "<leader>gd", ":Lspsaga peek_definition<CR>", opts)  -- peak definition
         vim.keymap.set("n", "<leader>gD", ":Lspsaga goto_definition<CR>", opts)  -- go to definition
         vim.keymap.set("n", "<leader>ca", ":Lspsaga code_action<CR>", opts)      -- see available code actions
         vim.keymap.set("n", "<leader>rn", ":Lspsaga rename<CR>", opts)           -- smart rename
         vim.keymap.set("n", "<leader>D", ":Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
         vim.keymap.set("n", "<leader>d", ":Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
         vim.keymap.set("n", "<leader>pd", ":Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to prev diagnostic in buffer
         vim.keymap.set("n", "<leader>nd", ":Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
         vim.keymap.set("n", "K", ":Lspsaga hover_doc<CR>", opts)                 -- show documentation for what is under cursor
         -- Toggle Terminal
         vim.keymap.set("n", "<leader>tm", "<cmd>Lspsaga term_toggle<CR>", opts)

         if client.name == "pyright" then
            vim.keymap.set("n", "<leader>oi", ":PyrightOrganizeImports<CR>", opts)          -- organise imports
            vim.keymap.set("n", "<leader>db", ":DapToggleBreakpoint<CR>", opts)             -- toggle breakpoint
            vim.keymap.set("n", "<leader>dr", ":DapContinue<CR>", opts)                     -- continue/invoke debugger
            vim.keymap.set("n", "<leader>dt", ":lua require('dap-python').test_method()<CR>", opts) -- run tests
         end
      end

      -- Call setup on each LSP server
      masonLspConfig.setup_handlers({
         function(server_name)
            lspconfig[server_name].setup({
               on_attach = lsp_attach,
               capabilities = lsp_capabilities,
            })
         end,
      })

      -- Lua LSP settings
      lspconfig.lua_ls.setup({
         settings = {
            Lua = {
               diagnostics = {
                  -- Get the language server to recognize the `vim` global
                  globals = { "vim" },
               },
            },
         },
      })
   end,
}
