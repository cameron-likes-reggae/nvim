return {
  { 'neovim/nvim-lspconfig' },
  { "onsails/lspkind.nvim" },

  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },

  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
    event = "BufEnter",
  },

  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    opts = {
      suggestion = {
        enabled = false,
        auto_trigger = true,
      },
      panel = {
        enabled = false
      }
    },
  },
  {
    "onsails/lspkind.nvim",
    config = function()
      require("lspkind").init({})
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    event = { "BufRead" },
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = {
          "bash",
          "c",
          "cpp",
          "css",
          "dockerfile",
          "go",
          "graphql",
          "html",
          "javascript",
          "json",
          "lua",
          "python",
          "rust",
          "scss",
          "typescript",
          "tsx",
          "yaml",
          "toml",
        },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true
        }
      }
    end,
  },

  {
    "luckasRanarison/tailwind-tools.nvim",
    name = "tailwind-tools",
    build = ":UpdateRemotePlugins",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim", -- optional
      "neovim/nvim-lspconfig",         -- optional
    },
    opts = {}                          -- your configuration
  },

  {
    "dgagn/diagflow.nvim",
    event = "BufRead",
  },
}
