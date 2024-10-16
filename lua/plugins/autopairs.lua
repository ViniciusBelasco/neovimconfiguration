-- Auto-completion of bracket/paren/quote pairs
return {
   "windwp/nvim-autopairs",
   event = "InsertEnter",
   opts = {
      check_ts = true, -- enable treesitter
      ts_config = {
         lua = { "String" }, -- Don't add pairs in lua string treesitter nodes
         javascript = { "Template_string" }, -- Don't add pairs in javascript Template_string
      }
   }
}
