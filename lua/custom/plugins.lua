local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
        ensure_installed = {
          "rust-analyzer",
          "omnisharp",
          "gopls",
          "typescript-language-server",
          "clangd",
          "clang-format",
          "emmet-ls",
          "phpactor"
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    ft ="rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function ()
      return require "custom.configs.rust-tools"
    end,
    config = function (_,opts)
      require('rust-tools').setup(opts)
      
    end
  },
  {
    "mfussenegger/nvim-dap",
  },
  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function ()
      require "custom.configs.lint"
      
    end
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
      opts = function ()
      return require "custom.configs.null-ls"
        
      end
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = function ()
      local conf = require("nvchad.configs.telescope")
      conf.defaults.mappiings.i = {
        ["<C-j>"] = require("telescope.actions").move_selection_next,
        ["<Esc>"] = require("telescope.actions").close,
      }
      return conf
    end,
  }
}
return plugins
