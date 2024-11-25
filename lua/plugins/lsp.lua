return {
  { 'neovim/nvim-lspconfig' },
  {
    'hrsh7th/nvim-cmp',
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer",
      'hrsh7th/cmp-nvim-lsp',
    },
  },
  { "onsails/lspkind.nvim" },

  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<M-y>",
          dismiss = "<M-]>",
        },
      },
      panel = { enabled = false },
    },
  },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
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
