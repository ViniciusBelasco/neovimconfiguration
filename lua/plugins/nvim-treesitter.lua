-- Code Tree Support / Syntax Highlighting
return {
   {
      "nvim-treesitter/nvim-treesitter",
      lazy = false;
      event = "VeryLazy",
      dependencies = {
         "nvim-treesitter/nvim-treesitter-textobjects",
      },
      build = ":TSUpdate",
      opts = {
         highlight = {
            enable = true,
            additional_vim_regex_highlighting = true,
         },
         indent = { enable = true },
         auto_install = true, -- automatically install syntax support when entering new file type buffer
         ensure_installed = {
            "bash",
            "c",
            "c_sharp",
            "cpp",
            "css",
            "diff",
            "dockerfile",
            "git_rebase",
            "gitcommit",
            "gitignore",
            "html",
            "java",
            "javascript",
            "json",
            "lua",
            "markdown",
            "markdown_inline",
            "python",
            "solidity",
            "tmux",
            "typescript",
            "vim",
            "vimdoc",
            "vue",
            "xml",
            "yaml",
         },
      },
      config = function(_, opts)
         local configs = require("nvim-treesitter.configs")
         configs.setup(opts)
      end,
   },
   {
      "nvim-treesitter/playground",
   },
}
