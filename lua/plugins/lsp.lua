return {
  { 'neovim/nvim-lspconfig' },
  { 'hrsh7th/cmp-nvim-lsp' },
  {
    'hrsh7th/nvim-cmp',
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
    opts = {
      ensure_installed = {
        'bash',
        'c',
        'cpp',
        'css',
        'dockerfile',
        'go',
        'gomod',
        'graphql',
        'html',
        'javascript',
        'json',
        'lua',
        'python',
        'rust',
        'scss',
        'typescript',
        'yaml',
      },
      highlight = {
        enable = true,
      },
    },

  }
}
--
--   {
--     "folke/lsp-colors.nvim",
--   },
--
--   -- LSP Zero for Language servers
--   "VonHeikemen/lsp-zero.nvim",
--   { "williamboman/mason.nvim" },
--   { "williamboman/mason-lspconfig.nvim" },
--   -- LSP Support
--   { "neovim/nvim-lspconfig" },
--   { "stevearc/conform.nvim",            opts = {} },
--   { "tikhomirov/vim-glsl" },
--
--   -- CMP
--   { "hrsh7th/nvim-cmp" },
--   { "hrsh7th/cmp-nvim-lsp" },
--   { "hrsh7th/cmp-buffer" },
--   { "hrsh7th/cmp-path" },
--   { "hrsh7th/cmp-cmdline" },
--   { "hrsh7th/cmp-calc" },
--   { "onsails/lspkind.nvim" },
--   {
--     "zbirenbaum/copilot.lua",
--     cmd = "Copilot",
--     event = "InsertEnter",
--     config = function()
--       require("copilot").setup({
--         suggestion = {
--           enabled = true,
--           auto_trigger = true,
--           keymap = {
--             accept = "<M-y>",
--             dismiss = "<M-]>",
--           },
--         },
--         panel = { enabled = false },
--       })
--     end,
--   },
--
--   -- Diagnostics
--   { "folke/trouble.nvim" },
--   { "dgagn/diagflow.nvim" },
--
--
--   {
--     "JoosepAlviste/nvim-ts-context-commentstring",
--     opts = {}
--   }
--
-- }
