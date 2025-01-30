return {
  { 'neovim/nvim-lspconfig' },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
    },
  },
  { "onsails/lspkind.nvim" },
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip").config.set_config({
        history = true,
        updateevents = "TextChanged,TextChangedI",
      })
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
  },
  { "saadparwaiz1/cmp_luasnip" },

  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  { "hrsh7th/cmp-path" },
  {
    'zbirenbaum/copilot-cmp',
    event = "InsertEnter",
    config = function()
      require("copilot_cmp").setup()
    end
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
