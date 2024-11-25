return {
  { 'neovim/nvim-lspconfig' },
  {
    'hrsh7th/nvim-cmp',
    event = "InsertEnter",
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
    },
    event = { "InsertEnter", "CmdlineEnter" },
    opts = {
      window = {
        completion = {
          border = "none",
          winhighlight = "NormalFloat:NormalFloat,FloatBorder:NormalFloat",
        }
      }
    },
  },
  { "onsails/lspkind.nvim" },

  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  {
    'zbirenbaum/copilot-cmp',
    config = function()
      require("copilot_cmp").setup()
    end
  },

  {
    "zbirenbaum/copilot.lua",
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
